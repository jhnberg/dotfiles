include scripts/make/xdg.mk

.PHONY: install
install: zsh-install-config

.PHONY: zsh-install-config
zsh-install-config:
	@echo zsh install config  iles
	@cp home/.zshenv $(HOME)/
	@cp home/.zshrc $(HOME)/
