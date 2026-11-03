#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright (C) 2018 OrangeFox Recovery Project

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    qcom_decrypt

# Encryption
PRODUCT_PACKAGES += \
    libcryptfs_hw

# Kernel
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/recovery/kernel:kernel

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := agassi
PRODUCT_NAME := full_agassi
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := MediaPad T3 10
PRODUCT_MANUFACTURER := Huawei
PRODUCT_CHARACTERISTICS := tablet
