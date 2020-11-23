#!/bin/bash

# Thin wrapper around merge_target_files to allow flag changes to be made in a
# presubmit-guarded change.

set -e

readonly DIST_DIR=$1
readonly VENDOR_DIR=$2
readonly BUILD_ID=$3

if [[ -z "${DIST_DIR}" ]]; then
  echo "error: dist dir argument not set"
  exit 1
fi
if [[ -z "${VENDOR_DIR}" ]]; then
  echo "error: vendor dir argument not set"
  exit 1
fi
if [[ -z "${BUILD_ID}" ]]; then
  echo "error: build id argument not set"
  exit 1
fi

# Move the system-only build artifacts to a separate folder
# so that the flashing tools use the merged files instead.
readonly SYSTEM_DIR=${DIST_DIR}/system_build
mkdir -p ${SYSTEM_DIR}
mv -f ${DIST_DIR}/android-info.txt ${SYSTEM_DIR}
mv -f ${DIST_DIR}/aosp_redfin_vf-*.zip ${SYSTEM_DIR}

source build/envsetup.sh
lunch aosp_redfin_vf-userdebug

out/host/linux-x86/bin/merge_target_files \
  --framework-target-files ${SYSTEM_DIR}/aosp_redfin_vf-target_files*.zip \
  --vendor-target-files ${VENDOR_DIR}/aosp_redfin-target_files-*.zip \
  --framework-item-list device/google/redfin/vf/framework_item_list.txt \
  --framework-misc-info-keys device/google/redfin/vf/framework_misc_info_keys.txt \
  --vendor-item-list device/google/redfin/vf/vendor_item_list.txt \
  --allow-duplicate-apkapex-keys \
  --output-target-files ${DIST_DIR}/aosp_redfin_vf-target_files-${BUILD_ID}.zip \
  --output-img  ${DIST_DIR}/aosp_redfin_vf-img-${BUILD_ID}.zip \
  --output-ota  ${DIST_DIR}/aosp_redfin_vf-ota-${BUILD_ID}.zip

# Copy bootloader.img, radio.img, and android-info.txt, needed for flashing.
cp ${VENDOR_DIR}/bootloader.img ${DIST_DIR}/bootloader.img
cp ${VENDOR_DIR}/radio.img ${DIST_DIR}/radio.img
unzip -j -d ${DIST_DIR} \
  ${VENDOR_DIR}/aosp_redfin-target_files-*.zip \
  OTA/android-info.txt
