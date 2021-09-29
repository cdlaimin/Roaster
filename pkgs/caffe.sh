# ================================================================
# Compile Caffe
# ================================================================

[ -e $STAGE/caffe ] && ( set -xe
    cd $SCRATCH

    "$ROOT_DIR/pkgs/utils/pip_install_from_git.sh" cython/cython numpy/numpy,v1.19.

    . "$ROOT_DIR/pkgs/utils/git/version.sh" BVLC/caffe,master
    until git clone --depth 1 --single-branch -b "$GIT_TAG" "$GIT_REPO"; do echo 'Retrying'; done
    cd caffe

    # ------------------------------------------------------------
    # Version assignment
    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    (
        . "$ROOT_DIR/pkgs/utils/fpm/toolchain.sh"
        . "$ROOT_DIR/pkgs/utils/fpm/distro_cc.sh"

        set +xe
        . /opt/intel/tbb/bin/tbbvars.sh intel64
        set -xe

        mkdir -p build
        cd $_

        export CCACHE_SLOPPINESS='include_file_ctime,include_file_mtime'
        "$TOOLCHAIN/cmake"                                  \
            -G"Ninja"                                       \
            -DBLAS=MKL                                      \
            -DCMAKE_BUILD_TYPE=Release                      \
            -DCMAKE_C_COMPILER="$CC"                        \
            -DCMAKE_CXX_COMPILER="$CXX"                     \
            -DCMAKE_{C,CXX,CUDA}_COMPILER_LAUNCHER=ccache   \
            -DCMAKE_C{,XX}_FLAGS="-fdebug-prefix-map='$SCRATCH'='$INSTALL_PREFIX/src' -g"   \
            -DCMAKE_INSTALL_PREFIX="$INSTALL_ABS"           \
            -DCMAKE_VERBOSE_MAKEFILE=ON                     \
            -DCUDA_ARCH_NAME="Manual"                       \
            -DCUDA_ARCH_BIN="35 60 61 70 75"                \
            -DCUDA_ARCH_PTX="50"                            \
            -DUSE_NCCL=ON                                   \
            -Dpython_version=3                              \
            ..

        time "$TOOLCHAIN/cmake" --build .
        time "$TOOLCHAIN/cmake" --build . --target runtest || ! nvidia-smi
        time "$TOOLCHAIN/cmake" --build . --target install

        # --------------------------------------------------------
        # Tag with version detected from cmake cache
        # --------------------------------------------------------

        "$TOOLCHAIN/cmake" -LA -N . | sed -n 's/^CAFFE_TARGET_VERSION:.*=//p' | xargs git tag -f
    )

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    # ------------------------------------------------------------

    cd
    rm -rf $SCRATCH/caffe
)
sudo rm -vf $STAGE/caffe
sync || true
