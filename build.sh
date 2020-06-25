#!/bin/sh

export CROSS_COMPILE=$HOME/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
export USE_CCACHE=1
export ARCH=arm
export TARGET=out
make O=$TARGET ARCH=$ARCH cactus_defconfig
make O=$TARGET ARCH=$ARCH -j$(nproc --all)
