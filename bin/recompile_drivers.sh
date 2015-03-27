#!/bin/bash

. /spike/bin/kernels.inc
packages="x11-drivers/ati-drivers::sabayon-distro x11-drivers/nvidia-drivers::spike sys-power/bbswitch x11-drivers/nvidia-userspace::spike app-laptop/nvidiabl::sabayon app-emulation/virtualbox-guest-additions app-emulation/virtualbox-modules 
x11-drivers/xf86-video-virtualbox"

rm -rf /usr/portage/packages/*
emerge -B virtualbox-bin
inject_build

for kernel in $kernels; do
	rm -rf /usr/portage/packages/*
        KERNEL_DIR="/usr/src/linux-${kernel}" emerge -B ${packages} || { echo "ouch unable to build" && exit 1; }
	inject_build
done

