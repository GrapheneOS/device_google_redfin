#
# Copyright (C) 2018 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_BOOTLOADER_BOARD_NAME := redfin
TARGET_SCREEN_DENSITY := 560
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165

include device/google/redbull/BoardConfig-common.mk
include device/google/redfin-sepolicy/redfin-sepolicy.mk

TARGET_BOARD_INFO_FILE := device/google/redfin/board-info.txt
USES_DEVICE_GOOGLE_REDFIN := true

TARGET_BOARD_COMMON_PATH := device/google/redfin/sm7250

# DTBO partition definitions
BOARD_PREBUILT_DTBOIMAGE := device/google/redfin-kernel/dtbo.img

TARGET_RECOVERY_UI_LIB := \
  librecovery_ui_redfin \
  libnos_citadel_for_recovery \
  libnos_for_recovery

TARGET_FS_CONFIG_GEN := device/google/redfin/config.fs

# Kernel modules
ifeq (,$(filter-out redfin_kasan, $(TARGET_PRODUCT)))
BOARD_VENDOR_KERNEL_MODULES += \
    $(wildcard device/google/redfin-kernel/kasan/*.ko)
else ifeq (,$(filter-out redfin_kernel_debug_memory, $(TARGET_PRODUCT)))
BOARD_VENDOR_KERNEL_MODULES += \
    $(wildcard device/google/redfin-kernel/debug_memory/*.ko)
else ifeq (,$(filter-out redfin_kernel_debug_locking, $(TARGET_PRODUCT)))
BOARD_VENDOR_KERNEL_MODULES += \
    $(wildcard device/google/redfin-kernel/debug_locking/*.ko)
else ifeq (,$(filter-out redfin_kernel_debug_hang, $(TARGET_PRODUCT)))
BOARD_VENDOR_KERNEL_MODULES += \
    $(wildcard device/google/redfin-kernel/debug_hang/*.ko)
else ifeq (,$(filter-out redfin_kernel_debug_api, $(TARGET_PRODUCT)))
BOARD_VENDOR_KERNEL_MODULES += \
    $(wildcard device/google/redfin-kernel/debug_api/*.ko)
else
BOARD_VENDOR_KERNEL_MODULES += \
    $(wildcard device/google/redfin-kernel/*.ko)
endif

# DTB
ifeq (,$(filter-out redfin_kasan, $(TARGET_PRODUCT)))
BOARD_PREBUILT_DTBIMAGE_DIR := device/google/redfin-kernel/kasan
else ifeq (,$(filter-out redfin_kernel_debug_memory, $(TARGET_PRODUCT)))
BOARD_PREBUILT_DTBIMAGE_DIR := device/google/redfin-kernel/debug_memory
else ifeq (,$(filter-out redfin_kernel_debug_locking, $(TARGET_PRODUCT)))
BOARD_PREBUILT_DTBIMAGE_DIR := device/google/redfin-kernel/debug_locking
else ifeq (,$(filter-out redfin_kernel_debug_hang, $(TARGET_PRODUCT)))
BOARD_PREBUILT_DTBIMAGE_DIR := device/google/redfin-kernel/debug_hang
else ifeq (,$(filter-out redfin_kernel_debug_api, $(TARGET_PRODUCT)))
BOARD_PREBUILT_DTBIMAGE_DIR := device/google/redfin-kernel/debug_api
else
BOARD_PREBUILT_DTBIMAGE_DIR := device/google/redfin-kernel
endif

# Testing related defines
#BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/r3-setup.sh

-include vendor/google_devices/redfin/proprietary/BoardConfigVendor.mk
