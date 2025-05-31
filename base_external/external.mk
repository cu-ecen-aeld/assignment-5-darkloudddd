# =============================================================================
# base_external/external.mk
#
# This Makefile fragment is loaded by Buildroot as soon as
# BR2_EXTERNAL_AESD_ASSIGNMENTS_PATH is defined in .config.
#
# It must:
#   1) include external.desc   (for name/desc/license)
#   2) include <your-package>.mk  (for rules to build/install)
# =============================================================================

# 1) Pull in the “name/desc/license” metadata from external.desc
include $(BR2_EXTERNAL_AESD_ASSIGNMENTS_PATH)/external.desc

# 2) Include our aesd-assignments package .mk
include $(BR2_EXTERNAL_AESD_ASSIGNMENTS_PATH)/package/aesd-assignments/aesd-assignments.mk

