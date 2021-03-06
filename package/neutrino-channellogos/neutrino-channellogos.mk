#
# fred_feuerstein's channellogos
#
NEUTRINO_CHANNELLOGOS_VER    = git
NEUTRINO_CHANNELLOGOS_DIR    = ni-logo-stuff.$(NEUTRINO_CHANNELLOGOS_VER)
NEUTRINO_CHANNELLOGOS_SOURCE = $(NEUTRINO_CHANNELLOGOS_DIR)
NEUTRINO_CHANNELLOGOS_URL    = https://github.com/neutrino-images/ni-logo-stuff.git

$(D)/neutrino-channellogos: bootstrap | $(SHARE_ICONS) $(SHARE_PLUGINS)
	$(START_BUILD)
	$(REMOVE)/$(NEUTRINO_CHANNELLOGOS_DIR)
	$(GET-GIT-SOURCE) $(NEUTRINO_CHANNELLOGOS_URL) $(ARCHIVE)/$(NEUTRINO_CHANNELLOGOS_SOURCE)
	$(CPDIR)/$(NEUTRINO_CHANNELLOGOS_DIR)
	rm -rf $(SHARE_ICONS)/logo
	mkdir -p $(SHARE_ICONS)/logo
	$(INSTALL_DATA) $(BUILD_DIR)/$(NEUTRINO_CHANNELLOGOS_DIR)/logos/* $(SHARE_ICONS)/logo
	mkdir -p $(SHARE_ICONS)/logo/events
	$(INSTALL_DATA) $(BUILD_DIR)/$(NEUTRINO_CHANNELLOGOS_DIR)/logos-events/* $(SHARE_ICONS)/logo/events
	$(CHDIR)/ni-logo-stuff.git/logo-links && \
		./logo-linker.sh logo-links.db $(SHARE_ICONS)/logo
	cp -a $(BUILD_DIR)/$(NEUTRINO_CHANNELLOGOS_DIR)/logo-addon/* $(SHARE_PLUGINS)
	$(REMOVE)/$(NEUTRINO_CHANNELLOGOS_DIR)
	$(TOUCH)
