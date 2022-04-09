#!/bin/bash

set -e

if [ ! -d "./build" ]; then
    cmake --preset=default # >/dev/null
fi

echo "Compiling..."
mold -run cmake --build --preset=default
echo "Done"
~/bin/tryrun ./build/bin/main
