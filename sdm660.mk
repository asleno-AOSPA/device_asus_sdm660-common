#
# Copyright (C) 2022 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.adm.buffering.ms=6 \
    vendor.audio_hal.period_multiplier=2

# Board Platform
TARGET_BOARD_PLATFORM := sdm660

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth.a2dp@1.0-impl \
    libbluetooth_audio_session

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.service.bdroid.sibs=false \
    persist.vendor.bt.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    vendor.qcom.bluetooth.soc=cherokee

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    bt.max.hfpclient.connections=1 \
    persist.bluetooth.a2dp_offload.cap=sbc-aac-aptx-aptxhd-ldac \
    persist.bluetooth.a2dp_offload.disabled=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxhd-aac-ldac \
    ro.bluetooth.a2dp_offload.supported=true \
    vendor.bluetooth.soc=cherokee

# Camera
PRODUCT_PACKAGES += \
    camera.sdm660

PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0.vendor \
    libxml2

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.eis.enable=1 \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.is_type=5 \
    persist.vendor.camera.mpo.disabled=1 \
    persist.vendor.camera.preview.ubwc=0 \
    persist.vendor.camera.HAL3.enabled=1

# Capability Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec \
    android.hardware.media.c2@1.0.vendor \
    android.hardware.media.c2@1.1.vendor

PRODUCT_VENDOR_PROPERTIES += \
    debug.stagefright.omx_default_rank.sw-audio=1 \
    debug.stagefright.omx_default_rank=0

# Config Store
PRODUCT_PACKAGES += \
    disable_configstore

# Data Modules
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.data.df.dev_name=rmnet_usb0

# Dalvik vm configuration
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Default is nosdcard, S/W button enabled in resource
PRODUCT_CHARACTERISTICS := nosdcard

# Disable APEX compression
PRODUCT_COMPRESSED_APEX := false

# Display
PRODUCT_PACKAGES += \
    gralloc.sdm660 \
    hwcomposer.sdm660 \
    memtrack.sdm660 \
    libvulkan

PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.frameworks.displayservice@1.0 \
    android.frameworks.displayservice@1.0.vendor \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.display.config@2.0 \
    vendor.display.config@1.0.vendor \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.allocator-service

PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.disable_backpressure=1 \
    debug.sf.hw=1 \
    debug.sf.recomputecrop=0 \
    persist.hwc.mdpcomp.enable=true \
    vendor.display.disable_rotator_downscale=1

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    debug.sf.latch_unsignaled=0 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    sdm.debug.disable_skip_validate=1 \
    vendor.display.enable_default_color_mode=1 \
    vendor.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm@1.4-service.clearkey

PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1.vendor

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# FUSE passthrough
PRODUCT_VENDOR_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# GMS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase.ms=android-asus-tpin \
    ro.com.google.rlzbrandcode=ASUP \
    ro.com.google.rlz_ap_whitelist=y0,y5,y6,y7,y9

# GPS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.overlay.izat.optin=rro

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    libhwbinder \
    libhidltransport \
    libhwbinder.vendor \
    libhidltransport.vendor

# HW crypto
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee

# Inherit several Android Go Configurations(Beneficial for everyone, even on non-Go devices)
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Init
PRODUCT_PACKAGES += \
    init.btmac.sh \
    init.qcom.sensors.sh \
    init.qti.dcvs.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.asus.biometrics.rc \
    init.qcom.asus.rc \
    init.target.rc

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout)

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# IRQ Balancer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Kernel
TARGET_KERNEL_VERSION := 4.19

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0.vendor

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-impl \
    mediametrics \
    libmediametrics \
    libregistermsext \
    libstagefright_enc_common \
    libavmediaserviceextensions

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    vidc.enc.target_support_bframe=1 \
    vendor.vidc.enc.disable_bframes=1 \
    vendor.vidc.dec.enable.downscalar=1 \
    vendor.vidc.enc.disable.pq=true

# NFC
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/nfc/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.nfc.port=I2C

TARGET_NFC_SKU := NFC

# Netflix
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.netflix.bsp_rev=Q660-13149-1

# Neuralnetworks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libmm-omxcore \
    libstagefrighthw \
    libc2dcolorconvert

# Overlay
PRODUCT_PACKAGES += \
    AsusSDM660Bluetooth \
    AsusSDM660Frameworks \
    AsusSDM660Settings

# Paranoid Doze
PRODUCT_PACKAGES += \
    ParanoidDoze

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.sensor.proximity=true \
    ro.sensor.pickup=asus.sensor.pickup

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.vr.high_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vr.high_performance.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# QNS
PRODUCT_PACKAGES += \
    libstdc++.vendor

# QTI Common Components
TARGET_COMMON_QTI_COMPONENTS += all

# Radio
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.1 \
    android.hardware.secure_element@1.2 \
    librmnetctl \
    libprotobuf-cpp-full

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.radio.VT_CAM_INTERFACE=2 \
    persist.sys.fflag.override.settings_provider_model=false

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    vendor.rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ro.telephony.iwlan_operation_mode=legacy \
    ro.com.android.dataroaming=false

# Radio (IMS)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.ims_volte_enable=1

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_asus

# Sensors
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/sensors/,$(TARGET_COPY_OUT_VENDOR)/etc/sensors)

PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    android.frameworks.sensorservice@1.0.vendor

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.vendor.qti.sensors.dev_ori=true \
    ro.vendor.qti.sensors.pmd=true \
    ro.vendor.qti.sensors.sta_detect=true \
    ro.vendor.qti.sensors.mot_detect=true

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.qti.sdk.sensors.gestures=false \
    ro.vendor.qti.sensors.cmc=false \
    ro.vendor.qti.sensors.facing=false

# Service Tracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.2-impl \
    vendor.qti.hardware.servicetracker@1.2-service

# SoC Information
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.model=SDM660 \
    ro.soc.manufacturer=QTI

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# SurfaceFlinger
PRODUCT_VENDOR_PROPERTIES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.sf.duration=30000000 \
    debug.sf.late.app.duration=24000000 \
    debug.sf.early.sf.duration=30000000 \
    debug.sf.early.app.duration=24000000 \
    debug.sf.earlyGl.sf.duration=30000000 \
    debug.sf.earlyGl.app.duration=24000000 \
    debug.sf.hwc.min.duration=21000000 \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.set_display_power_timer_ms=10000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.set_idle_timer_ms=80

# Time
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.timed.enable=true

# UBWC
PRODUCT_VENDOR_PROPERTIES += \
    vendor.video.disable.ubwc=1

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.usb.config=diag,serial_cdev,rmnet,adb

# FIXME: master: compat for libprotobuf
# See https://android-review.googlesource.com/c/platform/prebuilts/vndk/v28/+/1109518
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# WLAN
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wlan/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# XML
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.binary_xml=false

# Inherit the proprietary files
$(call inherit-product, vendor/asus/sdm660-common/sdm660-common-vendor.mk)
