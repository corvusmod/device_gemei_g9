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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/gemei/g9/g9.mk)
$(call inherit-product, device/gemei/g9/libraries/Android.mk)
$(call inherit-product, device/gemei/g9/packages/Android.mk)
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/gemei/g9/g9-vendor.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_g9
PRODUCT_DEVICE := g9
PRODUCT_BRAND := Allwinner
PRODUCT_MODEL := Sun4i
PRODUCT_MANUFACTURER := Allwinner
