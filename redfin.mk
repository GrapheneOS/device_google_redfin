# Inherit AOSP product configuration
$(call inherit-product, device/google/redfin/aosp_redfin.mk)

# Remove AOSP prefix from product name
PRODUCT_NAME := redfin
