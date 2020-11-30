#!/bin/bash
set -e
cd "$( dirname "${BASH_SOURCE[0]}" )"

for IAARCH in amd64 arm64; do
	curl -o focal-$IAARCH.qcow2 https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-$IAARCH.img
	qemu-img resize focal-$IAARCH.qcow2 10G
	qemu-img convert -f qcow2 focal-$IAARCH.qcow2 -O raw focal-$IAARCH.raw
	gzip focal-$IAARCH.raw
done

