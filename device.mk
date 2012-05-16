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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/allwinner/g9/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

BOARD_USE_LEGACY_TOUCHSCREEN := true

DEVICE_PACKAGE_OVERLAYS := device/allwinner/g9/overlay

PRODUCT_PACKAGES := \
	audio.a2dp.default \
	libaudioutils \
	libtinyalsa

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/allwinner/g9/init.sun4i.rc:root/init.sun4i.rc \
	device/allwinner/g9/init.rc:root/init.sun4i.rc \
	device/allwinner/g9/ueventd.sun4i.rc:root/ueventd.sun4i.rc \
	device/allwinner/g9/etc/vold.fstab:system/etc/vold.fstab \
	device/allwinner/g9/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/allwinner/g9/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	#device/allwinner/g9/prebuilt/install-recovery.sh:system/bin/install-recovery.sh \
	device/allwinner/g9/prebuilt/su:system/xbin/su \
	device/allwinner/g9/prebuilt/Superuser.apk:system/app/Superuser.apk \
	device/allwinner/g9/prebuilt/busybox:system/bin/busybox \
	device/allwinner/g9/prebuilt/reboot-recovery.sh:system/bin/reboot-recovery.sh

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
#	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	VisualizationWallpapers \
	librs_jni

# Key maps
PRODUCT_COPY_FILES += \
	device/allwinner/g9/prebuilt/hv_keypad.kl:system/usr/keylayout/hv_keypad.kl \
	device/allwinner/g9/prebuilt/sun4i-ir.kl:system/usr/keylayout/sun4i-ir.kl \
	device/allwinner/g9/prebuilt/sun4i-keyboard.kl:system/usr/keylayout/sun4i-keyboard.kl

# Propietary files
PRODUCT_COPY_FILES += \
	device/allwinner/g9/prebuilt/vendor/modules/8192cu.ko:system/vendor/modules/8192cu.ko \
	device/allwinner/g9/prebuilt/vendor/modules/bma250.ko:system/vendor/modules/bma250.ko \
	device/allwinner/g9/prebuilt/vendor/modules/ft5x_ts.ko:system/vendor/modules/ft5x_ts.ko \
	device/allwinner/g9/prebuilt/vendor/modules/gc0308.ko:system/vendor/modules/gc0308.ko \
	device/allwinner/g9/prebuilt/vendor/modules/goodix_touch.ko:system/vendor/modules/goodix_touch.ko \
	device/allwinner/g9/prebuilt/vendor/modules/gt2005.ko:system/vendor/modules/gt2005.ko \
	device/allwinner/g9/prebuilt/vendor/modules/mali.ko:system/vendor/modules/mali.ko \
	device/allwinner/g9/prebuilt/vendor/modules/mma7660.ko:system/vendor/modules/mma7660.ko \
	device/allwinner/g9/prebuilt/vendor/modules/sun4i_csi0.ko:system/vendor/modules/sun4i_csi0.ko \
	device/allwinner/g9/prebuilt/vendor/modules/sun4i_csi1.ko:system/vendor/modules/sun4i_csi1.ko \
	device/allwinner/g9/prebuilt/vendor/modules/ump.ko:system/vendor/modules/ump.ko \
	device/allwinner/g9/prebuilt/vendor/modules/videobuf-core.ko:system/vendor/modules/videobuf-core.ko \
	device/allwinner/g9/prebuilt/vendor/modules/videobuf-dma-contig.ko:system/vendor/modules/videobuf-dma-contig.ko \
	device/allwinner/g9/prebuilt/vendor/modules/x_mac.axf:system/vendor/modules/x_mac.axf \
	device/allwinner/g9/prebuilt/usr/idc/ft5x_ts.idc:system/usr/idc/ft5x_ts.idc \
	device/allwinner/g9/prebuilt/usr/idc/gt80x.idc:system/usr/idc/gt80x.idc \
	device/allwinner/g9/prebuilt/lib/libMali.so:system/lib/libMali.so \
	device/allwinner/g9/prebuilt/lib/libCedarA.so:system/lib/libCedarA.so \
	device/allwinner/g9/prebuilt/lib/libswdrm.so:system/lib/libswdrm.so \
	device/allwinner/g9/prebuilt/lib/libCedarX.so:system/lib/libCedarX.so \
	device/allwinner/g9/prebuilt/lib/libcedarxbase.so:system/lib/libcedarxbase.so \
	device/allwinner/g9/prebuilt/lib/libcedarv.so:system/lib/libcedarv.so \
	device/allwinner/g9/prebuilt/lib/libcedarxosal.so:system/lib/libcedarxosal.so \
	device/allwinner/g9/prebuilt/lib/libUMP.so:system/lib/libUMP.so \
	device/allwinner/g9/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
	device/allwinner/g9/prebuilt/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
	device/allwinner/g9/prebuilt/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
	device/allwinner/g9/prebuilt/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
	device/allwinner/g9/prebuilt/lib/hw/audio.primary.exDroid.so:system/lib/hw/audio.primary.exDroid.so \
	device/allwinner/g9/prebuilt/lib/hw/camera.exDroid.so:system/lib/hw/camera.exDroid.so \
	device/allwinner/g9/prebuilt/lib/hw/display.sun4i.so:system/lib/hw/display.sun4i.so \
	device/allwinner/g9/prebuilt/lib/hw/gralloc.sun4i.so:system/lib/hw/gralloc.sun4i.so \
	device/allwinner/g9/prebuilt/lib/hw/hwcomposer.exDroid.so:system/lib/hw/hwcomposer.exDroid.so \
	device/allwinner/g9/prebuilt/lib/hw/lights.sun4i.so:system/lib/hw/lights.sun4i.so \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
	device/allwinner/g9/prebuilt/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
	device/allwinner/g9/prebuilt/lib/hw/sensors.exDroid.so:system/lib/hw/sensors.exDroid.so

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	hwui.render_dirty_regions=false \
	qemu.sf.lcd_density=160

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

#Fix for dalvik-cache
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.verify-bytecode=false \
	dalvik.vm.dexopt-data-only=1



# for bugmailer
#PRODUCT_PACKAGES += send_bug
#PRODUCT_COPY_FILES += \
#	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
#	system/extras/bugmailer/send_bug:system/bin/send_bug
#
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/allwinner/g9/device-vendor.mk)
