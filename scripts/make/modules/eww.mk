include scripts/make/xdg.mk

.PHONY: install
install: eww-install-config

.PHONY: eww-install-config
eww-install-config:
	@echo eww installing config files
	@cp -r home/.config/eww $(XDG_CONFIG_HOME)/

