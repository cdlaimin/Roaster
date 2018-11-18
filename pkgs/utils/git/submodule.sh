#!/bin/bash

set +xe
. scl_source enable sclo-git212
set -e

SUBMODULE_QUEUE='.'

while [ "$SUBMODULE_QUEUE" ]; do
    pushd "$(cut -d';' -f1 <<< "$SUBMODULE_QUEUE;")"
    echo "Recurse into submodule \"$_\"."
    SUBMODULE_QUEUE="$(cut -d';' -f2- <<< "$SUBMODULE_QUEUE;" | sed 's/;*$//')"

    if [ -e .gitmodules ]; then
        if [ $GIT_MIRROR == $GIT_MIRROR_CODINGCAFE ]; then
            export HTTP_PROXY=proxy.codingcafe.org:8118
            [ $HTTP_PROXY ] && export HTTPS_PROXY=$HTTP_PROXY
            [ $HTTP_PROXY ] && export http_proxy=$HTTP_PROXY
            [ $HTTPS_PROXY ] && export https_proxy=$HTTPS_PROXY
            for i in 01org/mkl-dnn=intel/mkl-dnn philsquared/Catch=catchorg/Catch2; do
                sed -i "s/$(sed 's/\([\/\.]\)/\\\1/g' <<< "$i" | tr '=' '/')/" .gitmodules
            done
            for i in 01org ARM-software benjaminp catchorg eigenteam emil-e facebook{,incubator} google intel Maratyszcza NervanaSystems NVIDIA NVlabs onnx PeachPy pybind pytorch shibatch USCiLab; do
                sed -i "s/[^[:space:]]*:\/\/[^\/]*\(\/$i\/.*\)/$(sed 's/\//\\\//g' <<<$GIT_MIRROR )\1.git/" .gitmodules
                sed -i "s/\($(sed 's/\//\\\//g' <<<$GIT_MIRROR )\/$i\/.*\.git\)\.git[[:space:]]*$/\1/" .gitmodules
            done
        fi

        for i in $(seq 10 -1 0); do
            git submodule update --init -j 100 && break
            echo "Retrying... $i time(s) left."
        done

        SUBMODULE_QUEUE="$(sed 's/;;*/;/g' <<< "$SUBMODULE_QUEUE;$(git config --file .gitmodules --name-only --get-regexp path | cut -d'.' -f2- | sed 's/\.[^\.]*$//' | xargs readlink -e | paste -sd';' -)" | sed 's/^;*//' | sed 's/;*$//')"
    fi

    popd
done

