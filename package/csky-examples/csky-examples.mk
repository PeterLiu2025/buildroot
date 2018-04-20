################################################################################
#
# csky examples
#
################################################################################

CSKY_EXAMPLES_VERSION = $(BR2_PACKAGE_CSKY_EXAMPLES_VERSION)
ifeq ($(BR2_PACKAGE_CSKY_EXAMPLES_GITHUB),y)
CSKY_EXAMPLES_SITE = $(call github,c-sky,linux-sdk-examples,$(CSKY_EXAMPLES_VERSION))
else
CSKY_EXAMPLES_SITE = $(BR2_PACKAGE_CSKY_EXAMPLES_GIT_URL)
CSKY_EXAMPLES_SITE_METHOD = git
endif

ifeq ($(BR2_PACKAGE_FFMPEG),y)
CSKY_EXAMPLES_DEPENDENCIES += ffmpeg
endif

ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
CSKY_EXAMPLES_DEPENDENCIES += libsndfile
endif

CSKY_EXAMPLES_INSTALL_TARGET = YES

CSKY_EXAMPLES_TARGET_DIR = $(TARGET_DIR)/example

define CSKY_EXAMPLES_BUILD_CMDS
	$(MAKE) CSKY_EXAMPLES_TARGET_DIR=$(CSKY_EXAMPLES_TARGET_DIR) \
		BR2_PACKAGE_LIBSNDFILE=$(BR2_PACKAGE_LIBSNDFILE) \
		BR2_PACKAGE_FFMPEG=$(BR2_PACKAGE_FFMPEG) \
		BR2_PACKAGE_CSKY_EXAMPLES_WATCHDOG=$(BR2_PACKAGE_CSKY_EXAMPLES_WATCHDOG) \
		BR2_PACKAGE_CSKY_EXAMPLES_FB=$(BR2_PACKAGE_CSKY_EXAMPLES_FB) \
		BR2_PACKAGE_CSKY_EXAMPLES_SPI_FLASH=$(BR2_PACKAGE_CSKY_EXAMPLES_SPI_FLASH) \
		BR2_PACKAGE_CSKY_EXAMPLES_STORAGE=$(BR2_PACKAGE_CSKY_EXAMPLES_STORAGE) \
		BR2_PACKAGE_CSKY_EXAMPLES_TIMER=$(BR2_PACKAGE_CSKY_EXAMPLES_TIMER) \
		BR2_PACKAGE_CSKY_EXAMPLES_PWM=$(BR2_PACKAGE_CSKY_EXAMPLES_PWM) \
		BR2_PACKAGE_CSKY_EXAMPLES_NETWORK=$(BR2_PACKAGE_CSKY_EXAMPLES_NETWORK) \
		BR2_PACKAGE_CSKY_EXAMPLES_RTC=$(BR2_PACKAGE_CSKY_EXAMPLES_RTC) \
		BR2_PACKAGE_CSKY_EXAMPLES_UART=$(BR2_PACKAGE_CSKY_EXAMPLES_UART) \
		BR2_PACKAGE_CSKY_EXAMPLES_V4L2_DECODE=$(BR2_PACKAGE_CSKY_EXAMPLES_V4L2_DECODE) \
		BR2_PACKAGE_CSKY_EXAMPLES_V4L2_ENCODE=$(BR2_PACKAGE_CSKY_EXAMPLES_V4L2_ENCODE) \
		BR2_PACKAGE_CSKY_EXAMPLES_IIS=$(BR2_PACKAGE_CSKY_EXAMPLES_IIS) \
		BR2_PACKAGE_CSKY_EXAMPLES_FFMPEG_PLAYER=$(BR2_PACKAGE_CSKY_EXAMPLES_FFMPEG_PLAYER) \
		CC="$(TARGET_CC)" -C $(@D)
endef

define CSKY_EXAMPLES_INSTALL_TARGET_CMDS
	rm -f $(CSKY_EXAMPLES_TARGET_DIR)/.gitkeep
endef

$(eval $(generic-package))
