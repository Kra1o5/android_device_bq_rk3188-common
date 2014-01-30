#
# Copyright (C) 2011 The Android Open Source Project
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

# Set first, so they can be overridden by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

# Inherit from the proprietary version
-include vendor/bq/rockchip-common/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := rk30xx
TARGET_BOARD_HARDWARE := rk30board

TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

BOARD_EGL_CFG := device/bq/rockchip-common/prebuilt/egl.cfg
USE_OPENGL_RENDERER := true

ENABLE_WEBGL := true

# Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_LEGACY_NL80211_STA_EVENTS := true
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/wlan/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/etc/firmware/fw_RK903b2.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/etc/firmware/fw_RK903b2_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/etc/firmware/fw_RK903b2_apsta.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/rkwifi.ko"
WIFI_DRIVER_MODULE_NAME     := "wlan"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/bq/rockchip-common/bluetooth/vnd_rockchip.txt

# Kernel
BOARD_KERNEL_BASE := 0x60408000
BOARD_KERNEL_PAGESIZE := 16384
BOARD_CUSTOM_BOOTIMG_MK := device/bq/rockchip-common/mkbootimg.mk

# Recovery
TARGET_RECOVERY_INITRC := device/bq/rockchip-common/rootdir/recovery.rc
TARGET_RECOVERY_FSTAB := device/bq/rockchip-common/rootdir/recovery.fstab
TARGET_RECOVERY_PRE_COMMAND := "echo -n boot-recovery | busybox dd of=/dev/block/mtdblock0 count=1 conv=sync; sync"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun/file