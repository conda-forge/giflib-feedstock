#!/bin/bash

cp $RECIPE_DIR/CMakeLists.txt .
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j$CPU_COUNT
make -C ../tests UTILS=$PWD
make install
