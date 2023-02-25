# ================================================================
# Compile gRPC
# ================================================================

[ -e $STAGE/grpc ] && ( set -xe
    cd $SCRATCH

    # Known issue:
    # - gRPC 1.52.1 failed to build on CentOS 7.
    #   Pin to 1.51 for now.
    #   https://github.com/grpc/grpc/issues/32477
    . "$ROOT_DIR/pkgs/utils/git/version.sh" grpc/grpc,v1.51.
    until git clone --depth 1 --single-branch -b "$GIT_TAG" "$GIT_REPO"; do echo 'Retrying'; done
    cd grpc

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/git/submodule.sh"

    # ------------------------------------------------------------

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    (
        . "$ROOT_DIR/pkgs/utils/fpm/toolchain.sh"
        . "$ROOT_DIR/pkgs/utils/fpm/distro_cc.sh"

        mkdir -p build
        cd $_

        # --------------------------------------------------------
        # Known issues:
        #   - No unit tests available for run automatically.
        #   - Build tests with shared lib causes "undefined reference" error.
        #   - Tests are for internal use only.
        #     Bazel if preferred and no enough CMake support.
        #     See https://github.com/grpc/grpc/issues/18974
        # --------------------------------------------------------
        "$TOOLCHAIN/cmake"                          \
            -DBUILD_SHARED_LIBS=ON                  \
            -DCMAKE_BUILD_TYPE=Release              \
            -DCMAKE_C_COMPILER="$CC"                \
            -DCMAKE_CXX_COMPILER="$CXX"             \
            -DCMAKE_C{,XX}_COMPILER_LAUNCHER=ccache \
            -DCMAKE_C{,XX}_FLAGS="-I'$(realpath -e "../third_party/upb")' -fdebug-prefix-map='$SCRATCH'='$INSTALL_PREFIX/src' -g"   \
            -DCMAKE_INSTALL_PREFIX="$INSTALL_ABS"   \
            -DGFLAGS_USE_TARGET_NAMESPACE=ON        \
            -DgRPC_BUILD_TESTS=OFF                  \
            -DgRPC_BENCHMARK_PROVIDER=package       \
            -DgRPC_CARES_PROVIDER=package           \
            -DgRPC_INSTALL=ON                       \
            -DgRPC_PROTOBUF_PROVIDER=package        \
            -DgRPC_PROTOBUF_PACKAGE_TYPE=CONFIG     \
            -DgRPC_SSL_PROVIDER=package             \
            -DgRPC_ZLIB_PROVIDER=package            \
            -G"Ninja"                               \
            ..

        time "$TOOLCHAIN/cmake" --build .
        time "$TOOLCHAIN/cmake" --build . --target install
    )

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    # ------------------------------------------------------------

    cd
    rm -rf $SCRATCH/grpc
)
sudo rm -vf $STAGE/grpc
sync || true
