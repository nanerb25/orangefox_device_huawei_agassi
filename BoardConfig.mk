#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright (C) 2018 OrangeFox Recovery Project
# Device configuration for Huawei MediaPad T3 10 (agassi).

LOCAL_PATH := device/huawei/agassi
DEVICE_PATH := $(LOCAL_PATH)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Qualcomm MSM8937 / Adreno 308
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno308
TARGET_BOARD_SUFFIX := _64
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_NO_BOOTLOADER := true

# The device uses a legacy 2048-byte-page boot image with a separate DTB.
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_BOOTIMG_HEADER_VERSION := 0

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 \
    androidboot.console=ttyHSL0 \
    androidboot.hardware=qcom \
    msm_rtb.filter=0x237 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    androidboot.bootdevice=7824900.sdhci \
    earlycon=msm_hsl_uart,0x78B0000

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
# Huawei's stock bootloader expects the DTB appended to the gzip kernel blob.
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel.gz-dtb

BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Partition sizes from the supplied GPT. The userdata size matches the attached
# 16 GB W09 unit; Huawei grows this final GPT partition to fill the device.
BOARD_BOOTIMAGE_PARTITION_SIZE := 83886080
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 83886080
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3724541952
BOARD_VENDORIMAGE_PARTITION_SIZE := 771751936
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 201326592
BOARD_CUSTIMAGE_PARTITION_SIZE := 201326592
BOARD_USERDATAIMAGE_PARTITION_SIZE := 9651076096
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Data uses legacy footer-based full-disk encryption on stock firmware.
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_DECRYPTION := true

# TWRP / OrangeFox UI
TW_THEME := portrait_hdpi
TW_SCREEN_WIDTH := 800
TW_SCREEN_HEIGHT := 1280
TW_SCREEN_BLANK_ON_BOOT := true
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_FUSE_NTFS := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# OrangeFox Recovery
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
OF_USE_MAGISKBOOT := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
