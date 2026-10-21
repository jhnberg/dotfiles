# This is a file for helping to install zsh configuration files.

.PHONY: all
all:
	@echo run with the install target to insall zsh files.

.PHONY: install
install: zsh-install-config

.PHONY: zsh-install-config
zsh-install-config:
	@echo zsh install config files
	@cp home/.zshenv $(HOME)/
	@cp home/.zshrc $(HOME)/
