include scripts/make/xdg.mk

.PHONY: install
install: tmux-install-config

.PHONY: tmux-install-config
tmux-install-config:
	@echo tmux install config files
	@cp -r home/.config/tmux $(XDG_CONFIG_HOME)/
