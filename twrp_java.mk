#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from java device
$(call inherit-product, device/motorola/java/device.mk)

PRODUCT_DEVICE := java
PRODUCT_NAME := twrp_java
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(20)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="p352_Natv-user 11 RTAS31.68-66-2 66-2 release-keys"

BUILD_FINGERPRINT := motorola/java_retail/java:11/RTAS31.68-66-2/66-2:user/release-keys