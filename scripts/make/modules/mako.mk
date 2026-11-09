include scripts/make/xdg.mk

.PHONY: install
install: mako-install-config

.PHONY: mako-install-config
mako-install-config:
	@echo mako install config files
	@cp -r home/.config/mako $(XDG_CONFIG_HOME)/

