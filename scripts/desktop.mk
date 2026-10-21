# This file is a helper for installing config files for a desktop setup.
# This logical grouping includes several components.

XDG_CONFIG_HOME?=$(HOME)/.config/
.PHONY: all
all:

.PHONY: install
install: alacritty-install-config \
	     eww-install-config       \
		 hypr-install-config      \
		 mako-install-config      \
		 rofi-install-config      \
		 waybar-install-config    \
		 wlogout-install-config

.PHONY: alacritty-install-config
alacritty-install-config:
	@echo alacritty installing config files
	@cp -r home/.config/alacritty $(XDG_CONFIG_HOME)/

.PHONY: eww-install-config
eww-install-config:
	@echo eww installing config files
	@cp -r home/.config/eww $(XDG_CONFIG_HOME)/

.PHONY: hypr-install-config
hypr-install-config:
	@echo hypr install config files
	@cp -r home/.config/hypr $(XDG_CONFIG_HOME)/

.PHONY: mako-install-config
mako-install-config:
	@echo mako install config files
	@cp -r home/.config/mako $(XDG_CONFIG_HOME)/

.PHONY: rofi-install-config
rofi-install-config:
	@echo rofi install config files
	@cp -r home/.config/rofi $(XDG_CONFIG_HOME)/

.PHONY: waybar-install-config
waybar-install-config:
	@echo waybar install config files
	@cp -r home/.config/waybar $(XDG_CONFIG_HOME)/

.PHONY: wlogout-install-config
wlogout-install-config:
	@echo wlogout install config files
	@cp -r home/.config/wlogout $(XDG_CONFIG_HOME)/
