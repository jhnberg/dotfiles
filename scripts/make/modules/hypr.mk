include scripts/make/xdg.mk

.PHONY: install
install: hypr-install-config

.PHONY: hypr-install-config
hypr-install-config:
	@echo hypr install config files
	@cp -r home/.config/hypr $(XDG_CONFIG_HOME)/
