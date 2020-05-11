###########################################################
#
# wilcbtapps
#
###########################################################

WILCBTAPPS_VERSION = linux4sam-2020.04-rc1
WILCBTAPPS_SITE = https://github.com/MicrochipTech/wilcbtapps-buildroot-external-microchip.git
WILCBTAPPS_SITE_METHOD = git

WILCBTAPPS_DEPENDENCIES += bluez5_utils

define WILCBTAPPS_BUILD_CMDS

	$(TARGET_CC) $(TARGET_CFLAGS) -Wall -std=gnu11 -g -D_REENTRANT -I$(BLUEZ5_UTILS_DIR)/ -c $(@D)/transparent_service.c -o $(@D)/transparent_service.o
	$(TARGET_CC) $(TARGET_CFLAGS) -Wall -std=gnu11 -g -D_REENTRANT -I$(BLUEZ5_UTILS_DIR)/ -c $(@D)/wifi_prov_service.c -o $(@D)/wifi_prov_service.o

	$(TARGET_LD) $(TARGET_LDFLAGS) -L$(BLUEZ5_UTILS_DIR)/lib/.libs/ -L$(BLUEZ5_UTILS_DIR)/gdbus/.libs/ -L$(BLUEZ5_UTILS_DIR)/src/.libs/ $(@D)/transparent_service.o -o $(@D)/transparent_service -lc -lshared-mainloop -lbluetooth-internal -lgdbus-internal
	$(TARGET_LD) $(TARGET_LDFLAGS) -L$(BLUEZ5_UTILS_DIR)/lib/.libs/ -L$(BLUEZ5_UTILS_DIR)/gdbus/.libs/ -L$(BLUEZ5_UTILS_DIR)/src/.libs/ $(@D)/wifi_prov_service.o -o $(@D)/wifi_prov_service -lc -lshared-mainloop -lbluetooth-internal -lgdbus-internal

endef

define WILCBTAPPS_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/transparent_service \
                $(TARGET_DIR)/usr/sbin
        $(INSTALL) -D -m 0755 $(@D)/wifi_prov_service \
                $(TARGET_DIR)/usr/sbin
endef


$(eval $(generic-package))
