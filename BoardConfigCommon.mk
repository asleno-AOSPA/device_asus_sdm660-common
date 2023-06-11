#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/asus/sdm660-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := false
AUDIO_FEATURE_ENABLED_TFA98XX_AMPLIFIER := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_BTNV := true
TARGET_USE_QTI_BT_STACK := true

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true
CAMERA_USE_SDCLANG := true
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true
TARGET_USES_GRALLOC4 := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# ELF Prebuilts
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# GPS
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/configs/vintf/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(COMMON_PATH)/configs/vintf/device_framework_compatibility_matrix.xml

ODM_MANIFEST_SKUS := NFC
ODM_MANIFEST_NFC_FILES := $(COMMON_PATH)/configs/vintf/manifest-nfc.xml

# Kernel
BOARD_KERNEL_CMDLINE := \
	console=ttyMSM0,115200n8 \
	androidboot.console=ttyMSM0 \
	earlycon=msm_serial_dm,0xc170000 \
	androidboot.hardware=qcom \
	user_debug=31 \
	msm_rtb.filter=0x37 \
	ehci-hcd.park=3 \
	service_locator.enable=1 \
	loop.max_part=7
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
KERNEL_CUSTOM_LLVM := true
KERNEL_FULL_LLVM := true
KERNEL_SD_LLVM_SUPPORT := true

# Libinit
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_sdm660
TARGET_RECOVERY_DEVICE_MODULES := libinit_sdm660

# Override
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 367001600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55490624512
BOARD_VENDORIMAGE_PARTITION_SIZE := 838860800

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/tpd_gesture"

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init/etc/fstab.qcom

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_asus
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS := $(COMMON_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS := $(COMMON_PATH)/sepolicy/private

# Symlinks
TARGET_MOUNT_POINTS_SYMLINKS := true

# Treble
BOARD_VNDK_VERSION := current

# Vendor Security patch level
VENDOR_SECURITY_PATCH := 2022-03-05

# WLAN
BOARD_HAS_QCOM_WLAN := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"

# Inherit the proprietary files
include vendor/asus/sdm660-common/BoardConfigVendor.mk
