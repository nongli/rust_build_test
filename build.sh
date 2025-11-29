#!/bin/bash

echo "Building lib1..."
pushd lib1
cargo build
popd

echo "Building lib2..."
pushd lib2
cargo build
popd
