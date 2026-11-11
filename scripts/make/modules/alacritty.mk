include scripts/make/xdg.mk

.PHONY: install
install: alacritty-install-config

.PHONY: alacritty-install-config
alacritty-install-config:
	@echo alacritty installing config files
	@cp -r home/.config/alacritty $(XDG_CONFIG_HOME)/
