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

$(call inherit-product, device/gemei/g9/full_g9.mk)
$(call inherit-product, vendor/osr/products/high_tablet_device.mk)
$(call inherit-product, vendor/osr/products/base_telephony.mk)
$(call inherit-product, device/gemei/g9/g9-blobs.mk)
$(call inherit-product, vendor/osr/products/asian.mk)
$(call inherit-product, vendor/osr/products/hdpi.mk)
$(call inherit-product, vendor/osr/products/hdpi.mk)
$(call inherit-product, vendor/osr/products/facelock.mk)

-include vendor/osr/products/minimal_gapps.mk
-include vendor/osr/products/flashplayer.mk
-include vendor/osr/products/themes_common.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := osr_g9
PRODUCT_BRAND := Allwinner
PRODUCT_DEVICE := g9
PRODUCT_MODEL := Allwinner_Sun4i
PRODUCT_MANUFACTURER := Allwinner
PRODUCT_RELEASE_NAME := sun4i
PRODUCT_VERSION_MAINTENANCE := 0

PRODUCT_LOCALES := es_ES ca_ES zh_CN ja_JP ko_KR ru_RU en_US en_GB fr_FR it_IT de_DE hdpi

VENDOR_COPY_USER_DATA := true
VENDOR_WIPE_USER_DATA := false

DEVICE_PACKAGE_OVERLAYS += vendor/osr/overlay/mdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Sun4i BUILD_FINGERPRINT="iNet/crane_evb/crane-evb:4.0.4/IMM76I/20120330:eng/test-keys" PRIVATE_BUILD_DESC="crane_evb-eng 4.0.4 IMM76I 20120330 test-keys"
