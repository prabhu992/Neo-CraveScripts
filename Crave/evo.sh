#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/Evolution-X/manifest.git -b cnb --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b derp-17 https://github.com/prabhu992/local_manifests.git .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

/opt/crave/resync.sh

# Export
export BUILD_USERNAME=prabhu
export BUILD_HOSTNAME=crave
export TZ="Asia/India"
echo "======= Export Done ======"

rm -rf build/soong
git clone https://github.com/yaap-17-stone/build_soong --depth=1 build/soong

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_stone-cp2a-user
echo "============="

# Install clean
m installclean

# Build rom
m evolution
