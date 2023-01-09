#!/bin/sh
#MAKE_ARGS="-j$(($(grep cpu.cores /proc/cpuinfo | sort -u | sed 's/[^0-9]//g')+1))"
#make -j$(($(grep cpu.cores /proc/cpuinfo | sort -u | sed 's/[^0-9]//g')+1))

make -j$(nproc)
