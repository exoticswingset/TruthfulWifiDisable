INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
include ~/theos/makefiles/common.mk

TWEAK_NAME = TruthfulWifiDisable

TruthfulWifiDisable_FILES = Tweak.x
TruthfulWifiDisable_CFLAGS = -fobjc-arc

include ~/theos/makefiles/tweak.mk
