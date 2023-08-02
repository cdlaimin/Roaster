# ================================================================
# Install Extra CUDA Packages
# ================================================================

[ -e $STAGE/cuda ] && ( set -xe
    cd $SCRATCH

    # Need to push nvidia.cn very hard, before we have mirror for Ubuntu.
    case "$DISTRO_ID" in
    'debian' | 'linuxmint' | 'ubuntu')
        DEB_MAX_ATTEMPT=1000
        PKG_MAX_ATTEMPT=1000
        ;;
    esac

    # PyTorch does not fully support CUDA 12.0 as of Feb 2023.
    # - https://github.com/pytorch/pytorch/issues/91122
    export CUDA_VER_MAJOR="11"
    export CUDA_VER_MINOR="8"
    case "$DISTRO_ID" in
    'centos' | 'fedora' | 'rhel' | 'scientific')
        sudo dnf makecache
        for i in 'compat' 'toolkit'; do
            for attempt in $(seq "$RPM_MAX_ATTEMPT" -1 0); do
                [ "$attempt" -gt 0 ]
                dnf list -q "cuda-$i-$CUDA_VER_MAJOR-$CUDA_VER_MINOR"   \
                | sed -n "s/^\(cuda-$i-[0-9\-]*\).*/\1/p"               \
                | sort -Vu                                              \
                | tail -n1                                              \
                | xargs -r $RPM_INSTALL                                 \
                && break
                echo "Retrying... $(expr "$attempt" - 1) chance(s) left."
            done
        done
        ;;
    'debian' | 'linuxmint' | 'ubuntu')
        $DEB_REFRESH
        for i in 'compat' 'toolkit'; do
            for attempt in $(seq "$DEB_MAX_ATTEMPT" -1 0); do
                [ "$attempt" -gt 0 ]
                apt-cache show "cuda-$i-$CUDA_VER_MAJOR-$CUDA_VER_MINOR"                                        \
                | sed -n 's/^Package:[[:space:]]*\(cuda-\)/\1/p'                                                \
                | sort -Vu                                                                                      \
                | tail -n1                                                                                      \
                | sudo DEBIAN_FRONTEND=noninteractive xargs -r apt-get -o 'DPkg::Lock::Timeout=3600' install -y \
                && break
                echo "Retrying... $(expr "$attempt" - 1) chance(s) left."
            done
        done
        # Blacklist
        if false; then
            for attempt in $(seq "$DEB_MAX_ATTEMPT" -1 0); do
                [ "$attempt" -gt 0 ]
                apt-cache show 'cuda'                                                                           \
                | sed -n 's/^Package:[[:space:]]*cuda-//p'                                                      \
                | sort -Vu                                                                                      \
                | tail -n1                                                                                      \
                | xargs -I{} apt-cache show 'cuda-*-{}'                                                         \
                | sed -n 's/^Package:[[:space:]]*//p'                                                           \
                | grep -v '^cuda-demo-suite-'                                                                   \
                | grep -v '^cuda-runtime-'                                                                      \
                | paste -s -                                                                                    \
                | sudo DEBIAN_FRONTEND=noninteractive xargs apt-get -o 'DPkg::Lock::Timeout=3600' install -y    \
                && break
                echo "Retrying... $(expr "$attempt" - 1) chance(s) left."
            done
        fi
        ! dpkg -l cuda-drivers || $IS_CONTAINER
        ;;
    esac

    if $IS_CONTAINER; then
        # Note:
        #   - cuda-toolkit creates symlink "/usr/local/cuda -> /etc/alternatives/cuda -> /usr/local/cuda-<ver>".
        #     libnvidia-container cannot set up cuda-compat driver properly in this case.
        #     Use "ln -T" to overwrite dir symlink.
        #   - Only rel path "/usr/local/cuda -> cuda-<ver>" works for libnvidia-container, not "/usr/local/cuda -> /usr/local/cuda-<ver>".
        #     https://github.com/NVIDIA/libnvidia-container/issues/117
        ls -d "/usr/local/cuda-$CUDA_VER_MAJOR.$CUDA_VER_MINOR/" | sort -V | tail -n1 | xargs -n1 basename | sudo xargs -I{} ln -sfT {} "/usr/local/cuda"
    else
        for attempt in $(seq "$PKG_MAX_ATTEMPT" -1 0); do
            [ "$attempt" -gt 0 ]
            (
                set -e
                case "$DISTRO_ID" in
                'centos' | 'fedora' | 'rhel' | 'scientific')
                    $RPM_INSTALL "cuda-$CUDA_VER_MAJOR.$CUDA_VER_MINOR.*" 'nvidia-driver-latest-dkms'
                    $RPM_INSTALL 'cuda-drivers'
                    ;;
                'debian' | 'linuxmint' | 'ubuntu')
                    apt-cache show "cuda-toolkit-$CUDA_VER_MAJRO-$CUDA_VER_MINOR"   \
                    | sed -n 's/^Version:[[:space:]]*//p'                           \
                    | sort -Vu                                                      \
                    | tail -n1                                                      \
                    | xargs -I{} sudo DEBIAN_FRONTEND=noninteractive apt-get -o 'DPkg::Lock::Timeout=3600' install --allow-downgrades -y "cuda={}"
                    ;;
                esac
            ) && break
            echo "Retrying... $(expr "$attempt" - 1) chance(s) left."
        done
    fi

    [ -x '/usr/local/cuda/bin/nvcc' ]
    export CUDA_VER="$(/usr/local/cuda/bin/nvcc --version | sed -n 's/.*[[:space:]]V\([0-9\.]*\).*/\1/p')"
    export CUDA_VER_MAJOR="$(cut -d'.' -f1 <<< "$CUDA_VER")"
    export CUDA_VER_MINOR="$(cut -d'.' -f2 <<< "$CUDA_VER")"
    export CUDA_VER_BUILD="$(cut -d'.' -f3 <<< "$CUDA_VER")"

    # Note:
    # - CUDA version re-mapping should be maintained according to the latest release.
    # - Do not allow further version-coupled fallback below 11.4/2.10 due to a bug around 2.9.
    # - "tensorrt" pkgs are only available since CUDA 11.6.
    # - TensorRT 8.6.1.6 on Ubuntu route to CUDA 12.0 by default instead of 11.8, this may be a bug in Nvidia packaging.
    for attempt in $(seq "$PKG_MAX_ATTEMPT" -1 0); do
        [ "$attempt" -gt 0 ]
        (
            set -e
            case "$DISTRO_ID" in
            'centos' | 'fedora' | 'rhel' | 'scientific')
                $RPM_INSTALL                                                                                            \
                    libcudnn8{,-devel}"-*-*cuda$(sed 's/11\.[9]/11\.8/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR" | sed 's/12\.[2-9]/12\.1/')"  \
                    libnccl{,-devel,-static}"-*-*cuda$(sed 's/11\.[1-3]/11\.0/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR" | sed 's/11\.[9]/11\.8/' | sed 's/12\.[3-9]/12\.2/')" \
                    {libnv{infer{,-plugin},{,onnx}parsers}{8,-devel},tensorrt{,-{devel,libs}}}"-8.*-*cuda$(sed 's/11\.[12]/11\.0/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR" | sed 's/11\.[5]/11\.4/' | sed 's/11\.[7]/11\.6/' | sed 's/11\.[9]/11\.8/' | sed 's/12\.[1-9]/12\.0/')"
                ;;
            'debian' | 'linuxmint' | 'ubuntu')
                sudo DEBIAN_FRONTEND=noninteractive apt-get -o 'DPkg::Lock::Timeout=3600' install --allow-downgrades -y \
                    libcudnn8{,-dev}"=*+cuda$(sed 's/11\.[9]/11\.8/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR" | sed 's/12\.[2-9]/12\.1/')"     \
                    libnccl{2,-dev}"=*+cuda$(sed 's/11\.[1-3]/11\.0/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR" | sed 's/11\.[9]/11\.8/' | sed 's/12\.[3-9]/12\.2/')"           \
                    {lib{nvinfer{-{bin,headers{,-plugin}-dev,samples},{,-{dispatch,lean,{vc-,}plugin}}{8,-dev}},nv{,onnx}parsers{8,-dev}},tensorrt{,-{dev,libs}}}"=8.*+cuda$(sed 's/11\.[12]/11\.0/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR" | sed 's/11\.[5]/11\.4/' | sed 's/11\.[7]/11\.6/' | sed 's/11\.[9]/11\.8/' | sed 's/12\.[1-9]/12\.0/')"
                ;;
            esac
            ldconfig -p | grep libcudnn
            ldconfig -p | grep libnvinfer
            ldconfig -p | grep libnccl
        ) && break
        echo "Retrying... $(expr "$attempt" - 1) chance(s) left."
    done

    # ============================================================
    # TensorRT (Hack deprecated)
    #     TODO: Detect newest version outside of CodingCafe.
    # ============================================================
    if false; then
    (
        set -e

        TRT_REPO_URL='https://developer.nvidia.com/compute/machine-learning/tensorrt/7.0/7.0.0.11/local_repos'
        TRT_FILENAME="nv-tensorrt-repo-rhel$DISTRO_VERSION_ID-cuda$CUDA_VER_MAJOR.$CUDA_VER_MINOR-trt7.0.0.11-ga-20191216-1-1.x86_64.rpm"

        if [ "_$GIT_MIRROR" = "_$GIT_MIRROR_CODINGCAFE" ]; then
            TRT_REPO_URL_CODINGCAFE='https://repo.codingcafe.org/nvidia/tensorrt'
            TRT_FILENAME_CODINGCAFE="$(                     \
                curl -sSL "$TRT_REPO_URL_CODINGCAFE"        \
                | sed -n 's/^.*href="\([^"]*\)".*$/\1/p'    \
                | grep "rhel$DISTRO_VERSION_ID"             \
                | grep 'repo'                               \
                | grep '\.rpm$'                             \
                | sort -V                                   \
                | tail -n1)"
            if [ "$TRT_FILENAME_CODINGCAFE" ]; then
                TRT_REPO_URL="$TRT_REPO_URL_CODINGCAFE"
                TRT_FILENAME="$TRT_FILENAME_CODINGCAFE"
            else
                echo "[Warning] TensorRT image not found in CodingCafe repo."
            fi
        elif [ "_$GIT_MIRROR" = "_$GIT_MIRROR_GITHUB" ]; then
            TRT_REPO_URL='https://github.com/xkszltl/Roaster/releases/download/trt'
        fi

        TRT_URL="$TRT_REPO_URL/$TRT_FILENAME"

        sudo dnf remove -y --setopt=strict=0 'nv-tensorrt-repo-*' || true
        $RPM_INSTALL "$TRT_URL"
        $RPM_INSTALL --disableplugin=axelget "tensorrt" || $RPM_UPDATE --disableplugin=axelget "tensorrt" || $RPM_REINSTALL --disableplugin=axelget "tensorrt"
        $IS_CONTAINER && sudo dnf remove -y --setopt=strict=0 'nv-tensorrt-repo-*' || true
    )
    fi

    # ============================================================
    # CUDA Samples
    # ============================================================
    (
        set -xe

        # Known issues:
        # - By the end of May 2022, CUDA 11.7 does not have any samples, not even dummy pkgs.
        #   Use 11.6 version instead.
        #   https://github.com/NVIDIA/cuda-samples/issues/128
        # - CUDA 11.8 and 12.0 samples was added later in 2022.
        #   https://github.com/NVIDIA/cuda-samples/releases/tag/v11.8
        #   https://github.com/NVIDIA/cuda-samples/releases/tag/v12.0
        . "$ROOT_DIR/pkgs/utils/git/version.sh" NVIDIA/cuda-samples,"v$(sed 's/^11\.[7]$/11\.6/' <<< "$CUDA_VER_MAJOR.$CUDA_VER_MINOR")"
        until git clone --depth 1 -b "$GIT_TAG" "$GIT_REPO" "cuda-samples-$CUDA_VER_MAJOR-$CUDA_VER_MINOR"; do sleep 1; echo "Retrying"; done
        cd "cuda-samples-$CUDA_VER_MAJOR-$CUDA_VER_MINOR"

        # --------------------------------------------------------

        . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"
        rm -rf "$INSTALL_ABS/src"

        # CUDA 10.2 does not build due to missing nvscibuf.
        # See discussion in https://devtalk.nvidia.com/default/topic/1067000/where-is-quot-nvscibuf-h-quot-/?offset=13
        MPI_HOME=/usr/local/openmpi VERBOSE=1 time make -j$(nproc) -k all || true

        for cuda_util in deviceQuery{,Drv} topologyQuery {bandwidth,p2pBandwidthLatency}Test; do
            "bin/$(uname -m)/linux/release/$cuda_util" || true
        done

        mkdir -p "$INSTALL_ABS/cuda-$CUDA_VER_MAJOR.$CUDA_VER_MINOR/samples"
        find . -mindepth 1 -maxdepth 1 -not -name "$(basename "$(dirname "$INSTALL_ROOT")")" | xargs -I{} cp -aft "$INSTALL_ROOT/usr/local/cuda-$CUDA_VER_MAJOR.$CUDA_VER_MINOR/samples" {}

        # Exclude NVIDIA files.
        pushd "$INSTALL_ROOT"
        for i in "cuda-samples-$CUDA_VER_MAJOR-$CUDA_VER_MINOR"; do
            case "$DISTRO_ID" in
            'centos' | 'fedora' | 'rhel' | 'scientific')
                ! rpm -qa "$i" || rpm -ql "$i" | xargs -I{} find {} -maxdepth 0 -not -type d | sed -n 's/^\//\.\//p' | xargs rm -rf
                ;;
            'debian' | 'linuxmint' | 'ubuntu')
                ! dpkg -l "$i" || dpkg -L "$i" | xargs -I{} find {} -maxdepth 0 -not -type d | sed -n 's/^\//\.\//p' | xargs rm -rf
                ;;
            esac
        done
        popd

        "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

        # --------------------------------------------------------

        cd
        rm -rf "$SCRATCH/cuda-samples-$CUDA_VER_MAJOR-$CUDA_VER_MINOR"
    )
)
sudo rm -vf $STAGE/cuda
sync "$STAGE" || true
