#------------------------------------------------------------------------------
#  aesd-assignments package for Buildroot
#
#  We fetch from the "main" branch of your Assignment-3 repo, then
#  run “make” inside the finder-app/ subdirectory, and install everything
#  into /usr/bin and /etc/finder-app/conf on the target rootfs.
#------------------------------------------------------------------------------

AESD_ASSIGNMENTS_VERSION       = main
AESD_ASSIGNMENTS_SITE          = git@github.com:cu-ecen-aeld/assignments-3-and-later-darkloudddd.git
AESD_ASSIGNMENTS_SITE_METHOD   = git
# (No host-ssh dependency needed; Buildroot will use whatever SSH key is already set up
#  because you successfully cloned over git@github.com above.)

# Build commands: cd into finder-app/ and run “make”
define AESD_ASSIGNMENTS_BUILD_CMDS
	# Build both writer and finder inside finder-app/
	$(MAKE) -C $(@D)/finder-app \
	       CC="$(TARGET_CC)" \
	       CROSS_COMPILE="$(BR2_TARGET_ARCH)-" \
	       all
endef

# Install commands: copy the binaries out of finder-app/ into /usr/bin,
# then copy the conf directory into /etc/finder-app/conf.
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # 1) Create /usr/bin on the target
    $(INSTALL) -d $(TARGET_DIR)/usr/bin

    # 2) Copy writer binary
    $(INSTALL) -D -m 0755 $(@D)/finder-app/writer \
                   $(TARGET_DIR)/usr/bin/writer

    # 3) Copy the finder.sh script as “finder”
    $(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh \
                   $(TARGET_DIR)/usr/bin/finder

    # 4) Copy finder-test.sh into /usr/bin
    $(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh \
                   $(TARGET_DIR)/usr/bin/finder-test.sh

    # 5) Create and populate /etc/finder-app/conf
    #$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
    #$(INSTALL) -m 0644 $(@D)/finder-app/conf/finder.conf \
    #               $(TARGET_DIR)/etc/finder-app/conf/finder.conf
    # (Copy any other conf files from finder-app/conf/ if needed)
endef

$(eval $(generic-package))

