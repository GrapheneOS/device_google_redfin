#!/bin/bash

# Thin wrapper around merge_target_files to allow flag changes to be made in a
# presubmit-guarded change.

set -e

readonly DIST_DIR=$1
readonly VENDOR_DIR=$2

if [[ -z "${DIST_DIR}" ]]; then
  echo "error: dist dir argument not set"
  exit 1
fi
if [[ -z "${VENDOR_DIR}" ]]; then
  echo "error: vendor dir argument not set"
  exit 1
fi

source build/envsetup.sh
lunch aosp_redfin_vf-userdebug

out/host/linux-x86/bin/merge_target_files \
  --framework-target-files ${DIST_DIR}/aosp_redfin_vf-target_files*.zip \
  --vendor-target-files ${VENDOR_DIR}/aosp_redfin-target_files-*.zip \
  --framework-item-list device/google/redfin/vf/framework_item_list.txt \
  --framework-misc-info-keys device/google/redfin/vf/framework_misc_info_keys.txt \
  --vendor-item-list device/google/redfin/vf/vendor_item_list.txt \
  --allow-duplicate-apkapex-keys \
  --output-target-files ${DIST_DIR}/aosp_redfin_vf_merged-target_files.zip \
  --output-img  ${DIST_DIR}/aosp_redfin_vf_merged-img.zip \
  --output-ota  ${DIST_DIR}/aosp_redfin_vf_merged-ota.zip

# Copy bootloader.img and radio.img, needed for flashing.
cp ${VENDOR_DIR}/bootloader.img ${DIST_DIR}/bootloader.img
cp ${VENDOR_DIR}/radio.img ${DIST_DIR}/radio.img
