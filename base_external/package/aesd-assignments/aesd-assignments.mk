AESD_ASSIGNMENTS_VERSION = master
AESD_ASSIGNMENTS_SITE = git@github.com:darkloudddd/assignment-3-darkloudddd.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_DEPENDENCIES = host-ssh

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) -C $(@D) CC="$(TARGET_CC)" CROSS_COMPILE="$(BR2_TARGET_ARCH)-" all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # Install the cross-built writer and finder binaries
    install -D -m 755 $(@D)/writer   $(TARGET_DIR)/usr/bin/writer
    install -D -m 755 $(@D)/finder   $(TARGET_DIR)/usr/bin/finder

    # Install your test script
    install -D -m 755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/finder-test.sh

    # Copy the conf directory
    mkdir -p $(TARGET_DIR)/etc/finder-app/conf
    cp -r $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))

