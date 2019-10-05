#!/bin/bash

./configure --enable-R-framework
make

make check

make pdf
make info

# the "install*" commands require "sudo" for a system-wide installation
sudo make install
sudo make install-info
sudo make install-pdf
