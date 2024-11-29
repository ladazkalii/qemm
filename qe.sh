#!/bin/bash

# Update and install necessary packages
sudo apt update
sudo apt install -y qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# Download the Windows ISO
wget -O windows.iso "https://software-static.download.prss.microsoft.com/dbazure/888969d5-f34g-4e03-ac9d-1f9786c66749/26100.1742.240906-0331.ge_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"

# Create a virtual disk
qemu-img create -f qcow2 vm_disk.qcow2 20G

# Run the virtual machine
qemu-system-x86_64 \
    -m 32048 \
    -smp cores=56 \
    -cdrom windows.iso \
    -hda vm_disk.qcow2 \
    -boot d
