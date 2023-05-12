################################################################################
#
# s32gx-mkimage
#
################################################################################
S32GX_MKIMAGE_VERSION = bsp34.2-2020.04
S32GX_MKIMAGE_SITE = $(call github,nxp-auto-linux,u-boot,$(S32GX_MKIMAGE_VERSION))
S32GX_MKIMAGE_LICENSE = GPL-2.0+
S32GX_MKIMAGE_LICENSE_FILES = COPYING
HOST_S32GX_MKIMAGE_DEPENDENCIES = host-zlib

# i.MX8M needs a different binary
define HOST_S32GX_MKIMAGE_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
		CFLAGS="$(HOST_CFLAGS) -std=c99" \
		-C $(@D)/tools -f Makefile 
endef

define HOST_S32GX_MKIMAGE_INSTALL_CMDS
	$(INSTALL) -D -m 755 $(@D)/tools/mkimage_s32gx $(HOST_DIR)/bin/mkimage_s32gx
endef
# i.MX8 and i.MX8X
#define HOST_S32GX_MKIMAGE_BUILD_CMDS
#	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
#		CFLAGS="$(HOST_CFLAGS) -std=c99" \
#		-C $(@D) all MKIMG=mkimage_s32gx
#endef
define HOST_S32GX_MKIMAGE_INSTALL_CMDS
	$(INSTALL) -D -m 755 $(@D)/mkimage $(HOST_DIR)/bin/mkimage_s32gx
endef

$(eval $(host-generic-package))
