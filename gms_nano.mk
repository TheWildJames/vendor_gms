#
# Copyright (C) 2018-2019 The Google Pixel3ROM Project
# Copyright (C) 2024 The hentaiOS Project and its Proprietors
#
# Licensed under the Apache License, Version 2.0 (the License);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# p4rOS (flame) nano: minimal Play Store floor. Core GMS + Store + Setup
# only — everything else (Chrome/WebView, TTS, Dialer, Launcher, Calendar,
# Velvet, Messages, wallpapers, wellbeing, etc.) comes from the Play Store
# later. Fits stock Pixel 4 super with wide margin.
#

# APEX
DISABLE_DEXPREOPT_CHECK := true

PRODUCT_PACKAGES += \
    com.google.android.gmssystem.prodvic

# product/priv-app: Play Store only. No SetupWizard/PartnerSetup — NikGApps
# Core and LiteGapps Lite prove Play + login work without them; the Google
# account is added via Settings > Accounts (GSF/GMS handle it).
PRODUCT_PACKAGES += \
    Phonesky

# system/app: GMS shared libs (required by GMS core)
PRODUCT_PACKAGES += \
    GoogleExtShared

# system/priv-app: GMS services framework (required — provides gservices)
PRODUCT_PACKAGES += \
    GoogleServicesFramework

# PrebuiltGmsCore (required — the GMS core itself; ML/barcode libs dropped —
# Play/Setup don't need them)
PRODUCT_PACKAGES += \
    PrebuiltGmsCoreVic_AdsDynamite \
    PrebuiltGmsCoreVic_CronetDynamite \
    PrebuiltGmsCoreVic_DynamiteLoader \
    PrebuiltGmsCoreVic_DynamiteModulesA \
    PrebuiltGmsCoreVic_DynamiteModulesC \
    PrebuiltGmsCoreVic_GoogleCertificates \
    PrebuiltGmsCoreVic_MapsDynamite \
    PrebuiltGmsCoreVic_MeasurementDynamite \
    AndroidPlatformServices

$(call inherit-product, vendor/gms/product/blobs/product_blobs.mk)
$(call inherit-product, vendor/gms/system/blobs/system_blobs.mk)
$(call inherit-product, vendor/gms/system_ext/blobs/system-ext_blobs.mk)
