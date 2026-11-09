include scripts/make/xdg.mk

.PHONY: install
install: btop-install-config

.PHONY: btop-install-config
btop-install-config:
	@echo btop install config files
	@cp -r home/.config/btop $(XDG_CONFIG_HOME)/
