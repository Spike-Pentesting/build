#!/bin/bash

. /spike/bin/kernels.inc
packages=$@

for kernel in $kernels; do
	rm -rf /usr/portage/packages/*
        KERNEL_DIR="/usr/src/linux-${kernel}" emerge -B ${packages} || { echo "ouch unable to build" && exit 1; }
	inject_build
done

