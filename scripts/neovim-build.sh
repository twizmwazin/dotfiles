#!/bin/sh

sudo dnf -y install \
    libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip
make \
    CMAKE_BUILD_TYPE=Release \
    CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install
pip3 install --user neovim
