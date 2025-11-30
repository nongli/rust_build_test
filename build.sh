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

echo "Building combined..."
pushd combined_lib
cargo build
popd

if [[ $OSTYPE == 'darwin'* ]]; then
  FULL_LINK=-all_load
else
  FULL_LINK=--whole-archive
fi

echo "Linking combined..."
g++ main.cc \
  -Wall -Werror \
  -Wl,$FULL_LINK \
  -Lcombined_lib/target/debug -lcombined_lib\
  -o out-combined

# This does not work, this shows the issue with linking two libs
#echo "Linking both, fails..."
#g++ main.cc \
#  -Wall -Werror \
#  -Wl,$FULL_LINK \
#  -Llib1/target/debug -Llib2/target/debug -llib1 -llib2\
#  -o out-both
