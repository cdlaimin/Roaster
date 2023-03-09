# ================================================================
# Compile OpenBLAS
# ================================================================

[ -e $STAGE/openblas ] && ( set -xe
    cd $SCRATCH

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/git/version.sh" xianyi/OpenBLAS,v
    until git clone --depth 1 --single-branch -b "$GIT_TAG" "$GIT_REPO"; do echo 'Retrying'; done
    cd OpenBLAS

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    (
        . "$ROOT_DIR/pkgs/utils/fpm/toolchain.sh"
        . "$ROOT_DIR/pkgs/utils/fpm/distro_cc.sh"

        # mkdir -p build
        # pushd $_

        # cmake                                     \
        #     -DCMAKE_BUILD_TYPE=Release            \
        #     -DCMAKE_C_COMPILER=gcc                \
        #     -DCMAKE_CXX_COMPILER=g++              \
        #     -DCMAKE_INSTALL_PREFIX="$INSTALL_ABS" \
        #     -DCMAKE_VERBOSE_MAKEFILE=ON           \
        #     ..

        # time cmake --build . -- -j$(nproc)
        # time cmake --build . --target test
        # time cmake --build . --target install

        # popd

        make PREFIX="$INSTALL_ABS" -j$(nproc)
        # make PREFIX="$INSTALL_ABS" lapack-test -j$(nproc)
        # make PREFIX="$INSTALL_ABS" blas-test -j$(nproc)
        make PREFIX="$INSTALL_ABS" install

        # FPM does not exclude empty directory correctly.
        rmdir "$INSTALL_ABS/bin" || true
    )

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    # ------------------------------------------------------------

    cd
    rm -rf $SCRATCH/OpenBLAS
)
sudo rm -vf $STAGE/openblas
sync "$STAGE" || true
