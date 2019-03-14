#!/bin/bash

# ./configure --prefix=${PREFIX} --build=$BUILD --host=$HOST
make distcheck -j$CPU_COUNT

if [[ $(uname) == Linux ]]; then
    make check
fi
make install
