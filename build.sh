#!/bin/bash

echo "Building lib1..."
pushd lib1
cargo build
popd

echo "Building lib2..."
pushd lib2
cargo build
popd

# This works
echo "Linking just lib 1..."
g++ main.cc -Llib1/target/debug -llib1 -o out-lib1-only

# Why does this work?
g++ main.cc -Llib1/target/debug -Llib2/target/debug -llib1 -llib2  -o out-both
