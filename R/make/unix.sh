#!/bin/bash

./configure --enable-R-shlib

make

make check

make pdf
make info

make install
make install-info
make install-pdf
