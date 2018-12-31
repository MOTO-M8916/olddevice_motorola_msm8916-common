# Copyright (C) 2016 The CyanogenMod Project
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
LOCAL_SRC_FILES := MediaCodec.cpp AudioSource.cpp MetaData.cpp
LOCAL_SHARED_LIBRARIES := libstagefright libmedia
LOCAL_MODULE := libshims_camera
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# RIL + Qsap Shim
include $(CLEAR_VARS)
LOCAL_SRC_FILES := ASensorManager.cpp libqsap_shim.c
LOCAL_SHARED_LIBRARIES := android.hardware.sensors@1.0 libqsap_sdk liblog
LOCAL_STATIC_LIBRARIES := android.hardware.sensors@1.0-convert
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_MODULE := libqsapshim
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# QSAP_SDK
include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(TOP)/hardware/libhardware_legacy/wifi $(TOP)/external/libnl/include $(TOP)/external/wpa_supplicant_8/wpa_supplicant/src/drivers
LOCAL_MODULE := libqsap_sdk
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
LOCAL_CFLAGS += -DSDK_VERSION=\"0.0.1.0\"
LOCAL_USE_VNDK := true
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/qsap_api.h \
                               $(LOCAL_PATH)/qsap.h

LOCAL_CFLAGS += \
    -Wall \
    -Werror \
    -Wno-unused-variable \
    -Wno-unused-value \
    -Wno-format \
    -Wno-sometimes-uninitialized \
    -Wno-enum-conversion \
    -Wno-unused-parameter \
    -Wno-implicit-function-declaration

LOCAL_SRC_FILES := qsap_api.c \
                   qsap.c

LOCAL_PRELINK_MODULE := false
LOCAL_SHARED_LIBRARIES := libnetutils libutils libbinder libcutils libhardware_legacy libnl liblog
LOCAL_HEADER_LIBRARIES := libcutils_headers
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libqsap_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_VENDOR_MODULE := true
include $(BUILD_HEADER_LIBRARY)
