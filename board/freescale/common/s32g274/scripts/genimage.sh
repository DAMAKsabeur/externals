#!/usr/bin/env bash
echo "*********************************"
HOST_DIR="$2"
BINARIES_DIR="$1"

echo $HOST_DIR
echo $BINARIES_DIR

echo "*********************************"
#dd if=/dev/zero of=header.bin bs=1 count=1024
#declare -a array=([0]="0", [1]="0])
#${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py file --key RENAULT_2048_SECUREBOOT_KEY ${BINARIES_DIR}/Image.bin
rm -rf  ${BINARIES_DIR}/signed
mkdir  ${BINARIES_DIR}/signed
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/Image                             ${BINARIES_DIR}/Image
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/s32g274_linux_5.10.120_device.dtb ${BINARIES_DIR}/s32g274_linux_5.10.120_device.dtb
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/u-boot.bin                        ${BINARIES_DIR}/u-boot.bin
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/uboot-env.bin                     ${BINARIES_DIR}/uboot-env.bin
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/rootfs.ext2                       ${BINARIES_DIR}/rootfs.ext2
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/rootfs.ext4                       ${BINARIES_DIR}/rootfs.ext4
${HOST_DIR}/bin/python3 ${HOST_DIR}/boot_image_generation/scripts/sign.py  file --key RENAULT_2048_SECUREBOOT_KEY -o  ${BINARIES_DIR}/signed/rootfs.squashfs                   ${BINARIES_DIR}/rootfs.squashfs
#mv $BINARIES_DIR/Image.bin $BINARIES_DIR/Image.bin.orig
#mv $BINARIES_DIR/Image.sig $BINARIES_DIR/Image.bin 
