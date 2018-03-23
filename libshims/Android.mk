# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)

# Camera
include $(CLEAR_VARS)
LOCAL_SRC_FILES := MediaCodec.cpp
LOCAL_SHARED_LIBRARIES := libstagefright libmedia
LOCAL_MODULE := libshims_camera
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# GPS
include $(CLEAR_VARS)
LOCAL_SRC_FILES := get_process_name.c
LOCAL_MODULE := libshims_get_process_name
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# RIL
include $(CLEAR_VARS)
LOCAL_SRC_FILES := sensor.cpp
LOCAL_SHARED_LIBRARIES := libsensor
LOCAL_MODULE := libshim_ril
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := libqsap_shim.c
LOCAL_SHARED_LIBRARIES := libqsap_sdk liblog
LOCAL_C_INCLUDES := $(TOP)/system/qcom/softap/sdk
LOCAL_MODULE := libqsap_shim
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Boring-ssl shim
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    bio_b64.c \
    p_dec.c \
    p_enc.c \
    p_open.c \
    p_seal.c \
    rsa_pss.c
LOCAL_SHARED_LIBRARIES := liblog libcrypto
LOCAL_MODULE := libboringssl-compat
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
