#!/bin/bash

make -j$CPU_COUNT
if [[ $(uname) == Linux ]]; then
    make check
fi
make install
