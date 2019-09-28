#
# ofgwrite
#
OFGWRITE_VER    = git
OFGWRITE_DIR    = ofgwrite-nmp.$(OFGWRITE_VER)
OFGWRITE_SOURCE = $(OFGWRITE_DIR)
OFGWRITE_URL    = $(MAX-GIT-GITHUB)/$(OFGWRITE_SOURCE)

OFGWRITE_PATCH  = \
	fix_glibc_major.patch

$(D)/ofgwrite: bootstrap
	$(START_BUILD)
	$(REMOVE)/$(OFGWRITE_DIR)
	$(GET-GIT-SOURCE) $(OFGWRITE_URL) $(ARCHIVE)/$(OFGWRITE_SOURCE)
	$(CPDIR)/$(OFGWRITE_DIR)
	$(CHDIR)/$(OFGWRITE_DIR); \
		$(call apply_patches, $(OFGWRITE_PATCH)); \
		$(BUILD_ENV) \
		$(MAKE); \
	$(INSTALL_EXEC) $(BUILD_DIR)/$(OFGWRITE_DIR)/ofgwrite_bin $(TARGET_DIR)/usr/bin
	$(INSTALL_EXEC) $(BUILD_DIR)/$(OFGWRITE_DIR)/ofgwrite_caller $(TARGET_DIR)/usr/bin
	$(INSTALL_EXEC) $(BUILD_DIR)/$(OFGWRITE_DIR)/ofgwrite $(TARGET_DIR)/usr/bin
	$(REMOVE)/$(OFGWRITE_DIR)
	$(TOUCH)
