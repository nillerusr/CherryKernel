#!/bin/sh

export CROSS_COMPILE=$(pwd)gcc/bin/arm-linux-gnueabihf-
export USE_CCACHE=1
export ARCH=arm
export TARGET=out

configure()
{
  make O=$TARGET ARCH=$ARCH cactus_defconfig
}

build()
{
  make O=$TARGET ARCH=$ARCH -j$(nproc --all)
}

if ! [ -d gcc ]
then
  wget -q https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
  tar -xJf gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
  mv gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf gcc
  rm gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz
fi

if ! [ -f $TARGET/.config ]
then
  configure
fi

build
