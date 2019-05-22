#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those AOSP products, most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from common TWRP configuration.
$(call inherit-product, vendor/twrp/config/common.mk)

LOCAL_PATH := device/motorola/java

# HAL: Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    libgptutils \
    libz \
    libcutils

# A/B: update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier \
    update_engine_sideload

# A/B: OTA dexopt update_engine hookup
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# GMS: Partner ID
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Build ID
BUILD_FINGERPRINT := motorola/java_retail/java:11/RTAS31.68-66-2/66-2:user/release-keys

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="p352_Natv-user 11 RTAS31.68-66-2 66-2 release-keys"
