#############################################
#  Build and install the aesdsocket daemon  #
#############################################

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/server
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install daemon binary
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/

	# Install init script
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop \
		$(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

