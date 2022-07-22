DEVICE_PATH := device/nothing/phone2
TARGET_BOARD_PLATFORM := taro
TARGET_BOOTLOADER_BOARD_NAME := taro

# Default Android A/B configuration
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable debugfs restrictions
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Set GRF/Vendor freeze properties
BOARD_SHIPPING_API_LEVEL := 31
BOARD_API_LEVEL := 31

# Enable AVB 2.0
BOARD_AVB_ENABLE := true

# Disable verified boot checks in abl if AVB is not enabled
BOARD_ABL_SIMPLE := false

#Suppot to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

SHIPPING_API_LEVEL := 32
PRODUCT_SHIPPING_API_LEVEL := 32

# Set kernel version and ion flags
TARGET_KERNEL_VERSION := 5.10
TARGET_USES_NEW_ION := true

# Disable DLKM generation until build support is available
TARGET_KERNEL_DLKM_DISABLE := false

#####Dynamic partition Handling
###
#### Turning this flag to TRUE will enable dynamic partition/super image creation.
PRODUCT_BUILD_ODM_IMAGE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_PACKAGES += fastbootd
# Add default implementation of fastboot HAL.
PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-mock

PRODUCT_COPY_FILES += $(DEVICE_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

$(call inherit-product, build/make/target/product/gsi_keys.mk)

BOARD_HAVE_QCOM_FM := false

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc

$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# RRO configuration
TARGET_USES_RRO := true

TARGET_USES_QSSI := true

#Default vendor image configuration
ENABLE_VENDOR_IMAGE := true

# default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

BOARD_FRP_PARTITION_NAME := frp

PRODUCT_PACKAGES += fs_config_files

# A/B related packages
PRODUCT_PACKAGES += update_engine \
    update_engine_client \
    update_verifier \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
  update_engine_sideload

# QRTR related packages
PRODUCT_PACKAGES += qrtr-ns
PRODUCT_PACKAGES += qrtr-lookup
PRODUCT_PACKAGES += libqrtr

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

# Camera configuration file. Shared by passthrough/binderized camera HAL
PRODUCT_PACKAGES += camera.device@1.0-impl
PRODUCT_PACKAGES += camx.device@3.5-impl
PRODUCT_PACKAGES += camx.device@3.4-impl
PRODUCT_PACKAGES += camx.device@3.3-impl
PRODUCT_PACKAGES += camx.device@3.2-impl
PRODUCT_PACKAGES += camx.provider@2.4-impl
PRODUCT_PACKAGES += camx.provider@2.6-legacy
# Enable binderized camera HAL
PRODUCT_PACKAGES += vendor.qti.camera.provider@2.6-service_64

# Macro allows Camera module to use new service
QTI_CAMERA_PROVIDER_SERVICE := 2.7

# Enable compilation of image_generation_tool
TARGET_USES_IMAGE_GEN_TOOL := true

DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest_cape.xml
DEVICE_MATRIX_FILE   := device/qcom/common/compatibility_matrix.xml

# Kernel modules install path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := out/target/product/$(PRODUCT_NAME)/$(KERNEL_MODULES_INSTALL)/lib/modules

#Enable full treble flag
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Fingerprint feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \

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
