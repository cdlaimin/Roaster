# ================================================================
# Compile OpenCV
# ================================================================

[ -e $STAGE/opencv ] && ( set -xe
    cd $SCRATCH

    # ------------------------------------------------------------
    # Known issues:
    #   - OpenCV before 4.7.0 is not compatible with ffmpeg 5 due to a missing include.
    #     https://github.com/opencv/opencv/pull/22357
    #     https://github.com/opencv/opencv/commit/496eed950f6d0e7fd92619d47e3cec8f06e96ace
    # ------------------------------------------------------------
    . "$ROOT_DIR/pkgs/utils/git/version.sh" opencv/opencv,
    until git clone --single-branch -b "$GIT_TAG" "$GIT_REPO"; do echo 'Retrying'; done
    cd opencv

    # Patches:
    #   - Fix regresion due to the use of OpenEXR version macros since OpenCV 4.5.3.
    #     Expected to be released in 4.11.
    #     https://github.com/opencv/opencv/pull/26478
    #     https://github.com/opencv/opencv/commit/d0c8b36de8c35a5c3c88cb994243a0164c946fcb
    git fetch origin 4.x
    git cherry-pick --allow-empty --ff d0c8b36d

    # ------------------------------------------------------------

    git submodule add "../opencv_contrib.git" contrib
    pushd contrib
    git checkout "$GIT_TAG"
    popd
    git commit -am "Add opencv_contrib as submodule"

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    (
        set -e

        . "$ROOT_DIR/pkgs/utils/fpm/toolchain.sh"
        . "$ROOT_DIR/pkgs/utils/fpm/distro_cc.sh"

        if [ "_$GIT_MIRROR" = "_$GIT_MIRROR_CODINGCAFE" ]; then
            # export HTTP_PROXY=proxy.codingcafe.org:8118
            [ "$HTTP_PROXY" ] && export HTTPS_PROXY="$HTTP_PROXY"
            [ "$HTTP_PROXY" ] && export http_proxy="$HTTP_PROXY"
            [ "$HTTPS_PROXY" ] && export https_proxy="$HTTPS_PROXY"

            # Use mirrored download path in opencv cmake.
            (
                set -xe
                case "$DISTRO_ID-$DISTRO_VERSION_ID" in
                'centos-'* | 'fedora-'* | 'rhel-'* | 'scientific-'*)
                    set +xe
                    . scl_source enable rh-git227 || . scl_source enable rh-git218
                    set -xe
                    ;;
                esac
                GITHUB_RAW='https://raw.githubusercontent.com'
                git grep --name-only --recurse-submodules "$GITHUB_RAW" -- '*.cmake' '*/CMakeLists.txt' \
                | xargs -n1 sed -i "s/$(sed 's/\([\\\/\.\-]\)/\\\1/g' <<< "$GITHUB_RAW")\(\/[^\/]*\/[^\/]*\)/$(sed 's/\([\\\/\.\-]\)/\\\1/g' <<< "$GIT_MIRROR")\1\/raw/"
            )
        fi

        mkdir -p build
        cd $_

        # --------------------------------------------------------
        # Known issues:
        #   - CentOS 7 has OpenEXR 1.7 without version macros.
        #     Build embedded version in OpenCV instead.
        #   - OpenCV between 4.6 to 4.10 fail to build with the contrib RGBD lib.
        #     May only happen with the default OpenGL_GL_PREFERENCE=GLVND.
        #     Either disable RGBD or use LEGACY.
        #     https://github.com/opencv/opencv_contrib/issues/2307
        #     Following patch may also help but only when not set by user.
        #     https://github.com/opencv/opencv/pull/22836
        #     https://github.com/opencv/opencv/commit/d7a237aefc76f841dba64544d09ab6df53097206
        #   - Official FindPNG.cmake prefers /lib64/libpng.so on CentOS.
        #     Override with CMAKE_LIBRARY_PATH.
        #   - Separable CUDA causes symbol redefinition.
        # --------------------------------------------------------

        "$TOOLCHAIN/cmake"                                  \
            $(: || -DBUILD_OPENEXR=ON)                      \
            -DBUILD_PROTOBUF=OFF                            \
            -DBUILD_WITH_DEBUG_INFO=ON                      \
            -DBUILD_opencv_dnn=OFF                          \
            -DBUILD_opencv_rgbd=ON                          \
            -DBUILD_opencv_world=OFF                        \
            -DCMAKE_BUILD_TYPE=Release                      \
            -DCMAKE_AR="$(which "$AR")"                     \
            -DCMAKE_C_COMPILER="$CC"                        \
            -DCMAKE_CXX_COMPILER="$CXX"                     \
            -DCMAKE_{C,CXX,CUDA}_COMPILER_LAUNCHER=ccache   \
            -DCMAKE_C{,XX}_FLAGS="-fdebug-prefix-map='$SCRATCH'='$INSTALL_PREFIX/src' -g"   \
            -DCMAKE_INSTALL_PREFIX="$INSTALL_ABS"           \
            -DCMAKE_LIBRARY_PATH='/usr/local/lib64;/usr/local/lib;/usr/local/lib32'         \
            -DCMAKE_RANLIB="$(which "$RANLIB")"             \
            -DCMAKE_VERBOSE_MAKEFILE=ON                     \
            -DCPACK_BINARY_DEB=OFF                          \
            -DCPACK_BINARY_RPM=ON                           \
            -DCPACK_BINARY_STGZ=OFF                         \
            -DCPACK_BINARY_TBZ2=OFF                         \
            -DCPACK_BINARY_TGZ=OFF                          \
            -DCPACK_BINARY_TXZ=OFF                          \
            -DCPACK_BINARY_TZ=OFF                           \
            -DCPACK_SET_DESTDIR=ON                          \
            -DCPACK_SOURCE_RPM=ON                           \
            -DCPACK_SOURCE_STGZ=OFF                         \
            -DCPACK_SOURCE_TBZ2=OFF                         \
            -DCPACK_SOURCE_TGZ=OFF                          \
            -DCPACK_SOURCE_TXZ=OFF                          \
            -DCPACK_SOURCE_ZIP=OFF                          \
            $($TOOLCHAIN_CPU_NATIVE || printf '%s' "-DCPU_BASELINE=AVX")            \
            $($TOOLCHAIN_CPU_NATIVE || printf '%s' "-DCPU_DISPATCH='FP16;AVX2'")    \
            -DCUDA_NVCC_FLAGS='--expt-relaxed-constexpr'    \
            -DCUDA_SEPARABLE_COMPILATION=OFF                \
            -DENABLE_CCACHE=ON                              \
            -DENABLE_CXX11=ON                               \
            -DENABLE_LTO=ON                                 \
            -DENABLE_PRECOMPILED_HEADERS=ON                 \
            -DINSTALL_CREATE_DISTRIB=ON                     \
            -DINSTALL_TESTS=ON                              \
            -DMKL_WITH_OPENMP=ON                            \
            -DOPENCV_ENABLE_NONFREE=ON                      \
            -DOPENCV_EXTRA_MODULES_PATH='../contrib/modules'\
            $(: || printf '%s' '-DOpenGL_GL_PREFERENCE=GLVND')                      \
            -DPROTOBUF_UPDATE_FILES=ON                      \
            -DWITH_HALIDE=ON                                \
            -DWITH_LIBV4L=ON                                \
            -DWITH_MKL=ON                                   \
            -DWITH_NVCUVID=ON                               \
            -DWITH_OPENGL=ON                                \
            -DWITH_OPENMP=ON                                \
            -DWITH_QT=ON                                    \
            -DWITH_UNICAP=ON                                \
            -DWITH_VULKAN=ON                                \
            -G"Ninja"                                       \
            ..

        time "$TOOLCHAIN/cmake" --build . --target install
        # time "$TOOLCHAIN/cmake" --build . --target package
        # sudo $RPM_INSTALL ./OpenCV*.rpm || sudo $RPM_UPDATE -y ./OpenCV*.rpm || sudo rpm -ivh --nodeps ./OpenCV*.rpm || sudo rpm -Uvh --nodeps ./OpenCV*.rpm
    )

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    cd
    rm -rf $SCRATCH/opencv
)
sudo rm -vf $STAGE/opencv
sync "$STAGE" || true
