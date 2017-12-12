#
# Copyright (C) 2017 The Android Open Source Project
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
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := wallpaper2-glide-target
LOCAL_SDK_VERSION := current
LOCAL_SRC_FILES := ../../../prebuilts/maven_repo/bumptech/com/github/bumptech/glide/glide/SNAPSHOT/glide-SNAPSHOT$(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_UNINSTALLABLE_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := wallpaper2-disklrucache-target
LOCAL_SDK_VERSION := current
LOCAL_SRC_FILES := ../../../prebuilts/maven_repo/bumptech/com/github/bumptech/glide/disklrucache/SNAPSHOT/disklrucache-SNAPSHOT$(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_UNINSTALLABLE_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_MODULE := wallpaper2-gifdecoder-target
LOCAL_SDK_VERSION := current
LOCAL_SRC_FILES := ../../../prebuilts/maven_repo/bumptech/com/github/bumptech/glide/gifdecoder/SNAPSHOT/gifdecoder-SNAPSHOT$(COMMON_JAVA_PACKAGE_SUFFIX)
LOCAL_UNINSTALLABLE_MODULE := true
include $(BUILD_PREBUILT)

#
# Build app code.
#
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-v4 \
    android-support-v7-appcompat \
    android-support-v7-cardview \
    android-support-v7-recyclerview \
    android-support-compat \
    android-support-design \
    android-support-exifinterface \
    android-support-media-compat \
    wallpaper2-glide-target \
    wallpaper2-disklrucache-target \
    wallpaper2-gifdecoder-target \
    volley \
    libbackup \
    icc_profiles

LOCAL_SRC_FILES := $(call all-java-files-under, src) \
    $(call all-java-files-under, src_override) \

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
    $(LOCAL_PATH)/res_override \
    prebuilts/sdk/current/support/v7/appcompat/res \
    prebuilts/sdk/current/support/v7/cardview/res \
    prebuilts/sdk/current/support/v7/recyclerview/res \
    prebuilts/sdk/current/support/compat/res \
    prebuilts/sdk/current/support/core-ui/res \
    prebuilts/sdk/current/support/design/res \
    prebuilts/sdk/current/support/media-compat/res \

LOCAL_PROGUARD_FLAG_FILES := proguard.flags
LOCAL_PROGUARD_ENABLED := disabled

LOCAL_AAPT_FLAGS := \
    --auto-add-overlay \
    --extra-packages android.support.v4 \
    --extra-packages android.support.v7.appcompat \
    --extra-packages android.support.v7.cardview \
    --extra-packages android.support.v7.recyclerview \
    --extra-packages android.support.compat \
    --extra-packages android.support.coreui \
    --extra-packages android.support.design \
    --extra-packages android.support.mediacompat \
    --extra-packages android.support.transition

LOCAL_SDK_VERSION := 27
LOCAL_PACKAGE_NAME := WallpaperPicker2

include $(BUILD_PACKAGE)

# ==================================================
include $(call all-makefiles-under,$(LOCAL_PATH))
