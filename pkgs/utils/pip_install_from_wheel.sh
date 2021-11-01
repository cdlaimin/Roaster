#!/bin/bash

set -e

if [ ! "$ROOT_DIR" ]; then
    echo '$ROOT_DIR is not defined.'
    echo 'Running in standalone mode.'
    export ROOT_DIR="$(realpath -e "$(dirname "$0")")"
    until [ -x "$ROOT_DIR/setup.sh" ] && [ -d "$ROOT_DIR/pkgs" ]; do export ROOT_DIR=$(realpath -e "$ROOT_DIR/.."); done
    [ "_$ROOT_DIR" != "_$(readlink -f "$ROOT_DIR/..")" ]
    echo 'Set $ROOT_DIR to "'"$ROOT_DIR"'".'
fi

. "$ROOT_DIR/geo/pip-mirror.sh"

for i in setuptools pip wheel $@; do
    for py in $(which python3); do
        sudo -E PIP_INDEX_URL="$PIP_INDEX_URL" "$py" -m pip install -U "$i" || sudo PIP_INDEX_URL="$PIP_INDEX_URL" "$py" -m pip install -IU "$i"
    done
done
