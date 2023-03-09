# ================================================================
# Install TeX Live
# ================================================================

[ -e $STAGE/tex ] && ( set -xe
    export TEXLIVE_MIRROR=$(
        if [ $GIT_MIRROR = $GIT_MIRROR_CODINGCAFE ]; then
            echo 'https://repo.codingcafe.org/CTAN'
        else
            echo 'http://mirror.ctan.org'
        fi
    )'/systems/texlive/tlnet'

    cd $SCRATCH
    mkdir -p texlive
    cd $_

    curl -sSL $TEXLIVE_MIRROR/install-tl-unx.tar.gz | tar -zxvf -

    git init
    git add -A .
    git commit -m "Install"

    . "$ROOT_DIR/pkgs/utils/fpm/pre_build.sh"

    pushd install-tl-*
    ./install-tl --version

    git tag "$(basename "$(pwd)" | sed 's/.*-\([0-9][0-9][0-9][0-9]\)\([0-9][0-9]\)\([0-9][0-9]\)$/\1.\2.\3/')"

    export TEXLIVE_INSTALL_PREFIX="$INSTALL_ABS"

    echo 'selected_scheme scheme-full' > install_profile
    for retry in $(seq 5 -1 0); do
        [ "$retry" -gt 0 ]
        ./install-tl --repository $TEXLIVE_MIRROR --portable --profile './install_profile' && break
        echo "Retry installation. $(expr "$retry" - 1) time(s) left."
    done

    popd

    "$ROOT_DIR/pkgs/utils/fpm/install_from_git.sh"

    cd
    rm -rf $SCRATCH/texlive
)
sudo rm -vf $STAGE/tex
sync "$STAGE" || true
