#!/bin/bash
set -ex

echo "Building lib1..."
pushd lib1
cargo build
popd

echo "Building lib2..."
pushd lib2
cargo build
popd

# Why does this work?
echo "Linking both..."
g++ main.cc -Wall -Werror -Wl,--whole-archive -Llib1/target/debug -Llib2/target/debug -llib1 -llib2\
     -Wl,--no-whole-archive  -o out-both
