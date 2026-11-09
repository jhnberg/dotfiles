include scripts/make/xdg.mk

.PHONY: install
install: rofi-install-config

.PHONY: rofi-install-config
rofi-install-config:
	@echo rofi install config files
	@cp -r home/.config/rofi $(XDG_CONFIG_HOME)/

