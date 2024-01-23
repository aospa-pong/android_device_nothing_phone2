DEVICE_PATH := device/nothing/phone2

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_verifier \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script \
    update_engine_sideload

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# API
BOARD_API_LEVEL := 31
BOARD_SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 32
SHIPPING_API_LEVEL := 32

# Architecture
TARGET_BOARD_PLATFORM := taro
TARGET_BOOTLOADER_BOARD_NAME := taro

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# AVB
BOARD_AVB_ENABLE := true

# Biometrics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3.vendor \
    android.hardware.biometrics.fingerprint@2.3-service.nothing

TARGET_USES_FOD_ZPOS := true

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7.vendor \
    libcamera2ndk_vendor \
    vendor.qti.hardware.camera.aon@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Display
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.config-V2-ndk_platform.vendor \
    vendor.qti.hardware.display.config-V5-ndk_platform.vendor \
    vendor.qti.hardware.memtrack-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.4.vendor

# Emulated Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_files

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# Generic ramdisk
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# GPS
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

PRODUCT_PACKAGES += \
    android.hardware.gnss-V1-ndk_platform.vendor

# Health
$(call inherit-product, vendor/qcom/opensource/healthd-ext/health-vendor-product.mk)

PRODUCT_PACKAGES += \
    android.hardware.health@1.0.vendor \
    android.hardware.health@2.1.vendor

# Identity
PRODUCT_PACKAGES += \
    android.hardware.identity-V3-ndk_platform.vendor

# Image Generation Tool
TARGET_USES_IMAGE_GEN_TOOL := true

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.nt.rc \
    init.target.rc

# Kernel
KERNEL_PREBUILT_DIR := $(DEVICE_PATH)-kernel

# Keymaster
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml

PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.xml \
    android.hardware.keymaster@4.1.vendor \
    libkeymaster_messages.vendor

# Keymint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor \
    android.hardware.security.rkp-V3-ndk.vendor \
    android.hardware.security.secureclock-V1-ndk_platform.vendor \
    android.hardware.security.sharedsecret-V1-ndk_platform.vendor

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/vintf/phone2_vendor_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/vintf/manifest_cape.xml

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail_vendor \
    libcodec2_hidl@1.2.vendor \
    libcodec2_soft_common.vendor \
    libsfplugin_ccodec_utils.vendor

# NDK
NEED_AIDL_NDK_PLATFORM_BACKEND := true

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor

# Nothing Frameworks
PRODUCT_BOOT_JARS += \
    nothing-fwk

PRODUCT_PACKAGES += \
    nothing-fwk

# Overlays
PRODUCT_PACKAGES += \
    Phone2CarrierConfig \
    Phone2Frameworks \
    Phone2Nfc \
    Phone2Settings \
    Phone2SettingsProvider \
    Phone2SystemUI \
    WifiResTarget_cape \
    WifiResTarget_spf \
    WifiResTargetMainline_cape \
    WifiResTargetMainline_spf

# Partitions - Dynamic
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Partitions - FRP
BOARD_FRP_PARTITION_NAME := frp

# Partitions - Vendor
ENABLE_VENDOR_IMAGE := true

# QRTR
PRODUCT_PACKAGES += \
    qrtr-ns \
    qrtr-lookup \
    libqrtr

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    nfc \
    overlay \
    perf \
    telephony \
    usb \
    wfd \
    wlan

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.1-service.multihal \
    libsensorndkbridge \
    sensors.nothing

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# Suspend
PRODUCT_PACKAGES += \
    libsuspend

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti-v2

# TrustedUI
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Vibrator
PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

PRODUCT_PACKAGES += \
    android.hardware.vibrator-V2-ndk_platform.vendor

# Vendor Makefile
$(call inherit-product, vendor/nothing/phone2/phone2-vendor.mk)
