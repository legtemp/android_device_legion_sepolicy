#
# This policy configuration will be used by all products that
# inherit from Legion
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

BOARD_PLAT_PUBLIC_SEPOLICY_DIR += \
    device/legion/sepolicy/common/public

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/legion/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    device/legion/sepolicy/common/dynamic \
    device/legion/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/legion/sepolicy/common/dynamic \
    device/legion/sepolicy/common/vendor
endif

# Selectively include legacy rules defined by the products
-include device/legion/sepolicy/legacy-common/sepolicy.mk
