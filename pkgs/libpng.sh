# ================================================================
# Compile Libpng
# ================================================================

[ -e $STAGE/libpng ] && ( set -xe
    cd $SCRATCH

    # ------------------------------------------------------------

    if [ "_$GIT_MIRROR" = "_$GIT_MIRROR_CODINGCAFE" ]; then
        . "$ROOT_DIR/pkgs/utils/git/version.sh" libpng/libpng,v
        until git clone --single-branch -b "$GIT_TAG" "$GIT_REPO"; do echo 'Retrying'; done
    else
        export _GIT_MIRROR="$GIT_MIRROR"
        export GIT_MIRROR="git://git.code.sf.net/p"
        . "$ROOT_DIR/pkgs/utils/git/version.sh" libpng/code,v
        export GIT_MIRROR="$_GIT_MIRROR"
        env -u _GIT_MIRROR

        until git clone --single-branch -b "$GIT_TAG" "git://git.code.sf.net/p/libpng/code" libpng; do echo 'Retrying'; done
    fi
    cd libpng

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    (
        . "$ROOT_DIR/pkgs/utils/fpm/toolchain.sh"
        . "$ROOT_DIR/pkgs/utils/fpm/distro_cc.sh"

        mkdir -p build
        cd $_

        "$TOOLCHAIN/cmake"                                  \
            -DCMAKE_BUILD_TYPE=Release                      \
            -DCMAKE_C_COMPILER="$CC"                        \
            -DCMAKE_CXX_COMPILER="$CXX"                     \
            -DCMAKE_{C,CXX,CUDA}_COMPILER_LAUNCHER=ccache   \
            -DCMAKE_C{,XX}_FLAGS="-fdebug-prefix-map='$SCRATCH'='$INSTALL_PREFIX/src' -g"   \
            -DCMAKE_INSTALL_PREFIX="$INSTALL_ABS"           \
            -DCMAKE_VERBOSE_MAKEFILE=ON                     \
            -G"Ninja"                                       \
            ..

        time "$TOOLCHAIN/cmake" --build .
        time "$TOOLCHAIN/cmake" --build . --target install
        time "$TOOLCHAIN/ctest" --output-on-failure -j"$(nproc)"
    )

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    # ------------------------------------------------------------

    cd
    rm -rf $SCRATCH/libpng
)
sudo rm -vf $STAGE/libpng
sync || true
