DEVICE_PATH := device/nothing/phone2

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

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
    update_engine_sideload

# API
BOARD_API_LEVEL := 31
BOARD_SHIPPING_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 32
SHIPPING_API_LEVEL := 32

# Architecture
TARGET_BOARD_PLATFORM := taro
TARGET_BOOTLOADER_BOARD_NAME := taro

# AVB
BOARD_AVB_ENABLE := true
BOARD_ABL_SIMPLE := false

# Biometrics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Camera
PRODUCT_PACKAGES += \
    camera.device@1.0-impl \
    camx.device@3.5-impl \
    camx.device@3.4-impl \
    camx.device@3.3-impl \
    camx.device@3.2-impl \
    camx.provider@2.4-impl \
    camx.provider@2.6-legacy \
    vendor.qti.camera.provider@2.6-service_64

QTI_CAMERA_PROVIDER_SERVICE := 2.7

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# DebugFS
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Emulated Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Filesystem
PRODUCT_PACKAGES += \
    fs_config_files

# FM
BOARD_HAVE_QCOM_FM := false

# GSI
$(call inherit-product, build/make/target/product/gsi_keys.mk)

# Image Generation Tool
TARGET_USES_IMAGE_GEN_TOOL := true

# Init
PRODUCT_COPY_FILES += $(DEVICE_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc

# ION
TARGET_USES_NEW_ION := true

# Kernel
TARGET_HAS_GENERIC_KERNEL_HEADERS := true
TARGET_KERNEL_DLKM_DISABLE := false
TARGET_KERNEL_VERSION := 5.10

# Manifests
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest_cape.xml

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

# QSSI configuration
TARGET_USES_QSSI := true

# RRO configuration
TARGET_USES_RRO := true

# Storage
PRODUCT_CHARACTERISTICS := nosdcard

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

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
    vibrator \
    wfd \
    wlan
