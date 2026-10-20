# This make file is a helper for installing tree-sitter parsers and queries.
# Specifically for NeoVIM.
#
# The parsers are installed into:
# - $XDG_DATA_HOME/nvim/site/parser/
#
# The queries are installed into:
# - $XDG_DATA_HOME/nvim/site/queries/$LANG/

XDG_DATA_HOME?=$(HOME)/.local/share
NVIM_RDT_SITE:=$(XDG_DATA_HOME)/nvim
INSTALL_DIR:=$(NVIM_RDT_SITE)/site

# The list of languages to build/install
LANGS:= bash   \
		cpp    \
		make   \
		json   \
		python \
		rust

.PHONY: all
all:
	@echo use the install target to build and install the tree-sitter files into
	@echo your neovim rtp direcotry.

.PHONY: install
install: $(addprefix install-tree-sitter-,$(LANGS))

.PHONY: install-tree-sitter-%
install-tree-sitter-%: deps/tree-sitter-%/grammar.js
	mkdir -p $(INSTALL_DIR)/parser
	mkdir -p $(INSTALL_DIR)/queries/$*/
	tree-sitter build -o ~/.local/share/nvim/site/parser/$*.so deps/tree-sitter-$*
	cp -f deps/tree-sitter-$*/queries/*.scm ~/.local/share/nvim/site/queries/$*/
