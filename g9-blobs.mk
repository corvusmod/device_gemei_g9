# Copyright (C) 2012 The Android Open Source Project
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

# /system/bin
PRODUCT_COPY_FILES += \
	device/gemei/g9/prebuilt/bin/fsck.exfat:system/bin/fsck.exfat \
	device/gemei/g9/prebuilt/bin/mkfs.exfat:system/bin/mkfs.exfat \
	device/gemei/g9/prebuilt/bin/mount.exfat:system/bin/mount.exfat \
	device/gemei/g9/prebuilt/bin/ntfs-3g:system/bin/ntfs-3g \
	device/gemei/g9/prebuilt/bin/ntfs-3g.probe:system/bin/ntfs-3g.probe \
	device/gemei/g9/prebuilt/bin/mkntfs:system/bin/mkntfs \
	device/gemei/g9/prebuilt/bin/reboot-recovery.sh:system/bin/reboot-recovery.sh \
	device/gemei/g9/prebuilt/bin/usb_modeswitch:system/bin/usb_modeswitch

# /system/media
PRODUCT_COPY_FILES += \
	device/gemei/g9/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# /system/etc
PRODUCT_COPY_FILES += \
	device/gemei/g9/prebuilt/etc/ppp/ip-down:system/etc/ppp/ip-down \
	device/gemei/g9/prebuilt/etc/ppp/ip-up:system/etc/ppp/ip-up \
	device/gemei/g9/prebuilt/etc/ppp/call-pppd:system/etc/ppp/call-pppd \
	device/gemei/g9/prebuilt/etc/firmware/ath3k-1.fw:system/etc/firmware/ath3k-1.fw \
	device/gemei/g9/prebuilt/etc/firmware/ath3k-1.fw:system/vendor/firmware/ath3k-1.fw \
	device/gemei/g9/prebuilt/etc/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/gemei/g9/prebuilt/etc/camera.cfg:system/etc/camera.cfg \
	device/gemei/g9/prebuilt/etc/gps.conf:system/etc/gps.conf \
	device/gemei/g9/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/gemei/g9/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/gemei/g9/prebuilt/etc/usb_modeswitch.sh:system/etc/usb_modeswitch.sh \
	device/gemei/g9/prebuilt/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/gemei/g9/prebuilt/etc/init.d,system/etc/init.d)

PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/gemei/g9/prebuilt/etc/usb_modeswitch.d,system/etc/usb_modeswitch.d)

# /system/lib
PRODUCT_COPY_FILES += \
	device/gemei/g9/prebuilt/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
	device/gemei/g9/prebuilt/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
	device/gemei/g9/prebuilt/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
	device/gemei/g9/prebuilt/lib/hw/camera.gemei.so:system/lib/hw/camera.gemei.so \
	device/gemei/g9/prebuilt/lib/hw/sensors.gemei.so:system/lib/hw/sensors.gemei.so \
	device/gemei/g9/prebuilt/lib/liballwinner-ril.so:system/lib/liballwinner-ril.so \
	device/gemei/g9/prebuilt/lib/libMali.so:system/lib/libMali.so \
	device/gemei/g9/prebuilt/lib/libUMP.so:system/lib/libUMP.so \
	external/cedarx/CedarAndroidLib/LIB_ICS_F23/libstagefright_soft_cedar_h264dec.so:system/lib/libstagefright_soft_cedar_h264dec.so \
	device/gemei/g9/prebuilt/lib/libMali.so:obj/lib/libMali.so \
	device/gemei/g9/prebuilt/lib/libUMP.so:obj/lib/libUMP.so

# /system/usr
PRODUCT_COPY_FILES += \
	device/gemei/g9/prebuilt/usr/idc/ft5x_ts.idc:system/usr/idc/ft5x_ts.idc \
	device/gemei/g9/prebuilt/usr/idc/gt80x.idc:system/usr/idc/gt80x.idc \
	device/gemei/g9/prebuilt/usr/idc/Goodix-TS-board-3.idc:system/usr/idc/Goodix-TS-board-3.idc \
	device/gemei/g9/prebuilt/usr/keylayout/axp20-supplyer.kl:system/usr/keylayout/axp20-supplyer.kl \
	device/gemei/g9/prebuilt/usr/keylayout/sun4i-keyboard.kl:system/usr/keylayout/sun4i-keyboard.kl

PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/gemei/g9/prebuilt/lib/modules,system/lib/modules)
