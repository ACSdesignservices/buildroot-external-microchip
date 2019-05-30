################################################################################
#
# egt graphics library for microchip sam9x and sama5 soc's
#
################################################################################

EGT_VERSION = 737d12571e97e4281575ebdbe9515759ee3e3bc8
EGT_SITE = https://bitbucket.microchip.com/scm/linux4sam/egt.git
EGT_SITE_METHOD = git
EGT_GIT_SUBMODULES = YES
EGT_LICENSE = BSD
EGT_INSTALL_TARGET = YES
EGT_INSTALL_STAGING = YES
EGT_DEPENDENCIES = \
libevdev \
libgpiod \
g1-decoder \
libdrm \
libplanes \
cairo \
pango \
jpeg \
libpng \
gstreamer1 \
file

EGT_CONF_OPTS =

ifeq ($(BR2_PACKAGE_EGT_INSTALL_EXAMPLES),y)
EGT_CONF_OPTS += --enable-examples
else
EGT_CONF_OPTS += --disable-examples
endif

ifeq ($(BR2_PACKAGE_LIBCURL),y)
EGT_DEPENDENCIES += libcurl
endif

ifeq ($(BR2_PACKAGE_LIBRSVG),y)
EGT_DEPENDENCIES += librsvg
endif

define EGT_RUN_AUTOGEN
        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
EGT_POST_PATCH_HOOKS += EGT_RUN_AUTOGEN

$(eval $(autotools-package))
