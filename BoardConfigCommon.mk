# Copyright (C) 2013 The CyanogenMod Project
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

# inherit from msm8974-common
include device/sony/msm8974-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/shinano-common/include

# Platform
BOARD_VENDOR_PLATFORM := shinano

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := console=ttyHSL0,115200,n8 user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE  += dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE  += coherent_pool=8M vmalloc=300M
#BOARD_KERNEL_CMDLINE  += coherent_pool=8M vmalloc=255M mem=2690M
BOARD_KERNEL_CMDLINE  += androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE  += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_KERNEL_SEPARATED_DT := false
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/shinano-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/sony/shinano-common/bluetooth/vnd_shinano.txt

# CM Hardware
BOARD_HARDWARE_CLASS += device/sony/shinano-common/cmhw

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Init
#TARGET_INIT_VENDOR_LIB := libinit_shinano

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/sony/shinano-common/sepolicy

# Wifi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"

# NFC
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_DEVICE := /dev/pn54x

# FM definitions for Broadcom solution
BOARD_HAVE_ALTERNATE_FM := true
BOARD_HAVE_BCM_FM := true

# Props for hotplugging
TARGET_SYSTEM_PROP += device/sony/shinano-common/system.prop

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partition information
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2671771648

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/shinano-common/rootdir/fstab.shinano
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

#MultiROM config. MultiROM also uses parts of TWRP config
TARGET_RECOVERY_IS_MULTIROM := true
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/sony/shinano-common/multirom/mr_init_devices.c
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/sony/shinano-common/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_KEXEC_DTB := true
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_NO_KEXEC := enabled
MR_KEXEC_MEM_MIN := 0x3e7e0000
MR_FSTAB := device/sony/shinano-common/rootdir/twrp.fstab
MR_USE_MROM_FSTAB := true
MR_PIXEL_FORMAT := "RGBX_8888"

#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Ensure gzip compression for recovery
BOARD_NEEDS_LZMA_MINIGZIP := false

# TWRP
TW_MAX_BRIGHTNESS := 255
