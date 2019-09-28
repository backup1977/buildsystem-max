#
# vuduo4k-vmlinuz-initrd 7278b1
#
ifeq ($(VU_MULTIBOOT), 1)
VUDUO4K_VMLINUZ_INITRD_DATE   = 20190911
VUDUO4K_VMLINUZ_INITRD_URL    = https://bitbucket.org/max_10/vmlinuz-initrd-vuduo4k/downloads
else
VUDUO4K_VMLINUZ_INITRD_DATE   = 20181030
VUDUO4K_VMLINUZ_INITRD_URL    = http://archive.vuplus.com/download/kernel
endif
VUDUO4K_VMLINUZ_INITRD_VER    = $(VUDUO4K_VMLINUZ_INITRD_DATE)
VUDUO4K_VMLINUZ_INITRD_SOURCE = vmlinuz-initrd_vuduo4k_$(VUDUO4K_VMLINUZ_INITRD_VER).tar.gz

$(ARCHIVE)/$(VUDUO4K_VMLINUZ_INITRD_SOURCE):
	$(DOWNLOAD) $(VUDUO4K_VMLINUZ_INITRD_URL)/$(VUDUO4K_VMLINUZ_INITRD_SOURCE)

$(D)/vuduo4k-vmlinuz-initrd: bootstrap $(ARCHIVE)/$(VUDUO4K_VMLINUZ_INITRD_SOURCE)
	$(START_BUILD)
	tar -xf $(ARCHIVE)/$(VUDUO4K_VMLINUZ_INITRD_SOURCE) -C $(BUILD_DIR)
	$(TOUCH)
