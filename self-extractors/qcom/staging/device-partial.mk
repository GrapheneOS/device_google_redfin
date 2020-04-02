# Copyright 2020 The Android Open Source Project
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

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/redfin/proprietary \

PRODUCT_PACKAGES += \
    libeye_tracking_dsp_sample_stub \
    libhoaeffects_csim \
    libimscamera_jni \
    libimsmedia_jni \
    lib-imsvideocodec \
    liblistensoundmodel2.qti \
    libmmosal \
    libOpenCL_system \
    libqct_resampler \
    libqvr_cam_cdsp_driver_stub \
    libqvrcamera_client.qti \
    libqvr_cdsp_driver_stub \
    libqvr_eyetracking_plugin \
    libqvrservice \
    libqvrservice_client.qti \
    libqvrservice_ov7251_hvx_tuning \
    libqvrservice_ov9282_hvx_tuning \
    libvr_amb_engine \
    libvr_object_engine \

#  blob(s) necessary for redfin hardware
PRODUCT_COPY_FILES := \
     vendor/qcom/redfin/proprietary/qvrd.rc:system/etc/init/qvrd.rc \
     vendor/qcom/redfin/proprietary/6dof_config.xml:system/etc/qvr/6dof_config.xml \
     vendor/qcom/redfin/proprietary/qvrservice_config.txt:system/etc/qvr/qvrservice_config.txt \
     vendor/qcom/redfin/proprietary/org_codeaurora_ims.xml:system_ext/etc/permissions/org_codeaurora_ims.xml \
     vendor/qcom/redfin/proprietary/qcrilhook.xml:system_ext/etc/permissions/qcrilhook.xml \
     vendor/qcom/redfin/proprietary/telephonyservice.xml:system_ext/etc/permissions/telephonyservice.xml \
     vendor/qcom/redfin/proprietary/com.qti.snapdragon.sdk.display.jar:system_ext/framework/com.qti.snapdragon.sdk.display.jar \
     vendor/qcom/redfin/proprietary/com.qualcomm.qti.imscmservice-V2.0-java.jar:system_ext/framework/com.qualcomm.qti.imscmservice-V2.0-java.jar \
     vendor/qcom/redfin/proprietary/com.qualcomm.qti.imscmservice-V2.1-java.jar:system_ext/framework/com.qualcomm.qti.imscmservice-V2.1-java.jar \
     vendor/qcom/redfin/proprietary/com.qualcomm.qti.imscmservice-V2.2-java.jar:system_ext/framework/com.qualcomm.qti.imscmservice-V2.2-java.jar \
     vendor/qcom/redfin/proprietary/com.qualcomm.qti.uceservice-V2.0-java.jar:system_ext/framework/com.qualcomm.qti.uceservice-V2.0-java.jar \
     vendor/qcom/redfin/proprietary/com.qualcomm.qti.uceservice-V2.1-java.jar:system_ext/framework/com.qualcomm.qti.uceservice-V2.1-java.jar \
     vendor/qcom/redfin/proprietary/ConnectivityExt.jar:system_ext/framework/ConnectivityExt.jar \
     vendor/qcom/redfin/proprietary/qcrilhook.jar:system_ext/framework/qcrilhook.jar \
     vendor/qcom/redfin/proprietary/qti-telephony-hidl-wrapper.jar:system_ext/framework/qti-telephony-hidl-wrapper.jar \
     vendor/qcom/redfin/proprietary/qti-telephony-utils.jar:system_ext/framework/qti-telephony-utils.jar \
     vendor/qcom/redfin/proprietary/remotesimlockmanagerlibrary.jar:system_ext/framework/remotesimlockmanagerlibrary.jar \
     vendor/qcom/redfin/proprietary/uimremotesimlocklibrary.jar:system_ext/framework/uimremotesimlocklibrary.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.hardware.alarm-V1.0-java.jar:system_ext/framework/vendor.qti.hardware.alarm-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.hardware.data.connection-V1.0-java.jar:system_ext/framework/vendor.qti.hardware.data.connection-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.hardware.data.dynamicdds-V1.0-java.jar:system_ext/framework/vendor.qti.hardware.data.dynamicdds-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.hardware.data.iwlan-V1.0-java.jar:system_ext/framework/vendor.qti.hardware.data.iwlan-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.hardware.data.latency-V1.0-java.jar:system_ext/framework/vendor.qti.hardware.data.latency-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.hardware.fingerprint-V1.0-java.jar:system_ext/framework/vendor.qti.hardware.fingerprint-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.ims.callinfo-V1.0-java.jar:system_ext/framework/vendor.qti.ims.callinfo-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.ims.rcsconfig-V1.0-java.jar:system_ext/framework/vendor.qti.ims.rcsconfig-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.latency-V2.0-java.jar:system_ext/framework/vendor.qti.latency-V2.0-java.jar \
     vendor/qcom/redfin/proprietary/vendor.qti.voiceprint-V1.0-java.jar:system_ext/framework/vendor.qti.voiceprint-V1.0-java.jar \
     vendor/qcom/redfin/proprietary/QPerformance.jar:system/framework/QPerformance.jar \
     vendor/qcom/redfin/proprietary/UxPerformance.jar:system/framework/UxPerformance.jar \
