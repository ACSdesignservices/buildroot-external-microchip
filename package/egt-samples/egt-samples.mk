################################################################################
#
# egt sample applications
#
################################################################################

EGT_SAMPLES_VERSION = beda0b38d31d125ac9999a3c8d6c363d147123b8
EGT_SAMPLES_SITE = https://bitbucket.microchip.com/scm/linux4sam/egt-samples.git
EGT_SAMPLES_SITE_METHOD = git
EGT_SAMPLES_GIT_SUBMODULES = YES
EGT_SAMPLES_LICENSE = Apache-2.0
EGT_SAMPLES_INSTALL_TARGET = YES
EGT_SAMPLES_DEPENDENCIES = egt

EGT_SAMPLES_CONF_OPTS = --program-prefix='egt_'

define EGT_SAMPLES_RUN_AUTOGEN
        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
EGT_SAMPLES_POST_PATCH_HOOKS += EGT_SAMPLES_RUN_AUTOGEN

$(eval $(autotools-package))