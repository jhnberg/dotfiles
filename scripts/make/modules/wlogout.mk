include scripts/make/xdg.mk

.PHONY: install
install: wlogout-install-config

.PHONY: wlogout-install-config
wlogout-install-config:
	@echo wlogout install config files
	@cp -r home/.config/wlogout $(XDG_CONFIG_HOME)/
