#!/bin/bash

if [ ! "$ROOT_DIR" ]; then
    echo '$ROOT_DIR is not defined.'
    echo 'Running in standalone mode.'
    export ROOT_DIR="$(realpath -e "$(dirname "$0")")"
    until [ -x "$ROOT_DIR/setup.sh" ] && [ -d "$ROOT_DIR/pkgs" ]; do export ROOT_DIR=$(realpath -e "$ROOT_DIR/.."); done
    [ "_$ROOT_DIR" != "_$(readlink -f "$ROOT_DIR/..")" ]
    echo 'Set $ROOT_DIR to "'"$ROOT_DIR"'".'
fi

[ "$GIT_MIRROR" ] || . "$ROOT_DIR/pkgs/env/mirror.sh"

if [ "$1" ]; then
    export GIT_REPO="$GIT_MIRROR/$(cut -d, -f1 <<< "$1,").git"
    export GIT_PREFIX="$(cut -d, -f2 <<< "$1,")"
    export GIT_PREFIX_ESC="$(sed 's/\([\&\\\/\.\-]\)/\\\1/g' <<< "$GIT_PREFIX")"
    # Fallback order examples:
    #   1) v1.0
    #   2) master
    #   3) release-10
    export GIT_TAG="$(git ls-remote --heads --tags "$GIT_REPO" | sed -n 's/.*[[:space:]]refs\/[[:alpha:]]*\/\('"$GIT_PREFIX_ESC"'[0-9][0-9]*[\._\-][0-9\._\-]*\)[[:space:]]*$/\1/p' | sort -V | tail -n1)"
    [ "$GIT_TAG" ] || export GIT_TAG="$(git ls-remote --heads --tags "$GIT_REPO" | sed -n 's/.*[[:space:]]refs\/[[:alpha:]]*\/\('"$GIT_PREFIX_ESC"'\)[[:space:]]*$/\1/p' | sort -V | tail -n1)"
    [ "$GIT_TAG" ] || export GIT_TAG="$(git ls-remote --heads --tags "$GIT_REPO" | sed -n 's/.*[[:space:]]refs\/[[:alpha:]]*\/\('"$GIT_PREFIX_ESC"'[0-9][0-9\._\-]*\)[[:space:]]*$/\1/p' | sort -V | tail -n1)"
    if [ "$GIT_TAG" ]; then
        echo "Found git version tag \"$GIT_TAG\" in \"$GIT_REPO\"."
    else
        echo "Cannot find any git version tag in \"$GIT_REPO\" with prefix \"$GIT_PREFIX_ESC\"."
        exit 1
    fi
    export GIT_TAG_VER="$(sed 's/^[^0-9]*//' <<< "$GIT_TAG" | sed 's/[[:punct:]][[:punct:]]*/\./g')"
fi
