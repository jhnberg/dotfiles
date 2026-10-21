# This file is a helper for installing NeoVIM configuration files and extra
# dependencies.

XDG_CONFIG_HOME?=$(HOME)/.config
XDG_DATA_HOME?=$(HOME)/.local/share
NVIM_CONFIG_DIR=$(XDG_CONFIG_HOME)/nvim
NVIM_DATA_DIR:=$(XDG_DATA_HOME)/nvim

# The list of languages to build/install for tree-sitter.
# This is not including any parsers/queries which already ship
# with NeoVIM.
LANGS:= bash   \
		cpp    \
		css    \
		go     \
		json   \
		make   \
		python \
		rust

.PHONY: all
all:
	@echo run with the install target to install nvim files.
	@echo
	@echo NVIM_CONFIG_DIR=$(NVIM_CONFIG_DIR)
	@echo NVIM_DATA_DIR=$(NVIM_DATA_DIR)

.PHONY: install
install: nvim-install-config $(addprefix nvim-install-tree-sitter-,$(LANGS))

.PHONY: nvim-install-config
nvim-install-config:
	@echo nvim installing config files
	@mkdir -p $(NVIM_CONFIG_DIR)
	@cp -r home/.config/nvim/ $(XDG_CONFIG_HOME)/

# Installing tree-sitter parsers (and query files). These go into the nvim
# XDG_DATA_HOME directory.
.PHONY: nvim-install-tree-sitter-%
nvim-install-tree-sitter-%: deps/tree-sitter-%/grammar.js
	@echo nvim installing tree-sitter-$*
	@mkdir -p $(NVIM_DATA_DIR)/site/parser
	@mkdir -p $(NVIM_DATA_DIR)/site/queries/$*/
	@tree-sitter build -o $(NVIM_DATA_DIR)/site/parser/$*.so deps/tree-sitter-$*
	@cp -f deps/tree-sitter-$*/queries/*.scm $(NVIM_DATA_DIR)/site/queries/$*/
