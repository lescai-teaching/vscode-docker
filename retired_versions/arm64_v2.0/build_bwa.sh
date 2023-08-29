#!/bin/sh
ARCH=`uname -m`
if [ "$ARCH" = "aarch64" ] ; then
  wget https://raw.githubusercontent.com/DLTcollab/sse2neon/master/sse2neon.h
  sed -i -e 's/<emmintrin.h>/"sse2neon.h"/' ksw.c
  make clean
  make all CFLAGS="-g -Wall -Wno-unused-function -O3 -mtune=native"
else
  make clean
  make all CFLAGS="-g -Wall -Wno-unused-function -O3 -mtune=native"
fi