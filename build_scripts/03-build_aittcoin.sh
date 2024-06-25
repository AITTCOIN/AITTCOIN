#!/bin/bash

AITTCOINROOT=$(pwd)
OS=$1

find ./src -name '*.o' -type f -delete
find ./src -name '*.a' -type f -delete
find ./src -name '*.so' -type f -delete
find ./src -name '*.dylib' -type f -delete

make clean


make -j8

case "$OS" in
    "linux")
        mkdir -p $AITTCOINROOT/bin/linux
        mv ./src/aittcoin-cli ./bin/linux
        mv ./src/aittcoind ./bin/linux
        mv ./src/qt/aittcoin-qt ./bin/linux
        strip ./bin/linux/*
        ;;
    "windows")
        mkdir -p $AITTCOINROOT/bin/win
        mv $AITTCOINROOT/src/*.exe $AITTCOINROOT/bin/win
        mv $AITTCOINROOT/src/qt/*.exe $AITTCOINROOT/bin/win
        strip --strip-unneeded $AITTCOINROOT/bin/win/*
        ;;
    "arm")
        mkdir -p $AITTCOINROOT/bin/arm
        mv ./src/aittcoin-cli ./bin/arm
        mv ./src/aittcoind ./bin/arm
        mv ./src/qt/aittcoin-qt ./bin/arm
        strip ./bin/arm/*
        ;;
    "osx")
        mkdir -p $AITTCOINROOT/bin/osx
        mv ./src/aittcoin-cli ./bin/osx
        mv ./src/aittcoind ./bin/osx
        mv ./src/qt/aittcoin-qt ./bin/osx
        strip ./bin/osx/*
        ;;
    *)
        echo "Unsupported OS type: $OS"
        echo "Supported OS types: linux, windows, arm, osx"
        exit 1
        ;;
esac

echo "Build and strip completed for $OS"
