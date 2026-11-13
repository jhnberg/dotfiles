include scripts/make/xdg.mk

.PHONY: install
install: gamemode-install-config

.PHONY: gamemode-install-config
gamemode-install-config:
	@echo gamemode install config files
	@cp -r home/.config/gamemode.ini $(XDG_CONFIG_HOME)/
