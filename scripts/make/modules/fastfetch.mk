include scripts/make/xdg.mk

.PHONY: install
install: fastfetch-install-config

.PHONY: fastfetch-install-config
fastfetch-install-config:
	@echo fastfetch install config files
	@cp -r home/.config/fastfetch $(XDG_CONFIG_HOME)/
