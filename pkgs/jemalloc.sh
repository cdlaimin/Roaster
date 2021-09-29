# ================================================================
# Compile Jemalloc
# ================================================================

[ -e $STAGE/jemalloc ] && ( set -xe
    cd $SCRATCH

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/git/version.sh" jemalloc/jemalloc,
    until git clone --depth 1 --single-branch -b "$GIT_TAG" "$GIT_REPO"; do echo 'Retrying'; done
    cd jemalloc

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    (
        . "$ROOT_DIR/pkgs/utils/fpm/toolchain.sh"
        . "$ROOT_DIR/pkgs/utils/fpm/distro_cc.sh"

        ./autogen.sh                    \
            --enable-{prof,xmalloc}     \
            --prefix="$INSTALL_ABS"     \
            --with-jemalloc-prefix=""

        time make -j$(nproc) dist
        time make -j$(nproc)
        time make -j$(nproc) install
    )

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    # ------------------------------------------------------------

    cd
    rm -rf $SCRATCH/jemalloc
)
sudo rm -vf $STAGE/jemalloc
sync || true
