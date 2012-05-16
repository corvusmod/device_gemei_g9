#
# Copyright (C) 2011 The Android Open-Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/allwinner/g9/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true

TARGET_PREBUILT_KERNEL := device/allwinner/g9/kernel
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_CMDLINE := console=ttyS0,115200 rw init=/init loglevel=8
BOARD_KERNEL_PAGESIZE := 2048
#BOARD_NAND_PAGE_SIZE :=
#BOARD_NAND_SPARE_SIZE :=

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := exDroid
TARGET_BOOTLOADER_BOARD_NAME := crane

#BOARD_EGL_CFG := device/allwinner/g9/egl.cfg

USE_OPENGL_RENDERER := true

#BOARD_USE_SKIA_LCDTEXT := true

#TARGET_RECOVERY_INITRC := device/allwinner/g9/recovery_init.rc
TARGET_RECOVERY_PRE_COMMAND := "echo -n boot-recovery | busybox dd of=/dev/block/nandf count=1 conv=sync; sync"
#TARGET_RECOVERY_PIXEL_FORMAT := ""
#BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/allwinner/a10/recovery_keys.c
#BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
#BOARD_UMS_2ND_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun1/file"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_PROVIDES_INIT_RC := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
WIFI_DRIVER_MODULE_PATH     := "/system/vendor/modules/8192cu.ko"
#WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "8192cu"
#WIFI_EXT_MODULE_PATH        := "/system/lib/modules/nano_if.ko"
#WIFI_EXT_MODULE_ARG         := "nrx_config=/system/lib/modules"
#WIFI_EXT_MODULE_NAME        := "nano_if"

BOARD_HAVE_BLUETOOTH := false
#BOARD_HAVE_BLUETOOTH_BCM := true

#COMMON_GLOBAL_CFLAGS += -DEGL_ALWAYS_ASYNC -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS
BOARD_USE_LEGACY_TOUCHSCREEN := true
#BOARD_USE_LEGACY_TRACKPAD := true
#BOARD_USES_AUDIO_LEGACY := true
#TARGET_USES_OLD_LIBSENSORS_HAL := true
#TARGET_SENSORS_NO_OPEN_CHECK := true
#TARGET_USE_CUSTOM_LUN_FILE_PATH := ""

#TARGET_USES_CUSTOM_VIBRATOR_PATH := "/sys/class/timed_output/sun4i-vibrator/enable"
