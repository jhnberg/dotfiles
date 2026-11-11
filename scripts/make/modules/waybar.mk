include scripts/make/xdg.mk

.PHONY: install
install: waybar-install-config

.PHONY: waybar-install-config
waybar-install-config:
	@echo waybar install config files
	@cp -r home/.config/waybar $(XDG_CONFIG_HOME)/

