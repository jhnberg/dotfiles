# This make file is a helper for installing tree-sitter parsers and queries.
# Specifically for NeoVIM.
#
# The parsers are installed into:
# - $XDG_DATA_HOME/nvim/site/parser/
#
# The queries are installed into:
# - $XDG_DATA_HOME/nvim/site/queries/$LANG/

.PHONY: all
all: install

.PHONY: install
install: install-tree-sitter-cpp

.PHONY: install-tree-sitter-cpp
install-tree-sitter-cpp:
	mkdir -p ~/.local/share/nvim/site/queries/cpp/
	tree-sitter build -o ~/.local/share/nvim/site/parser/cpp.so deps/tree-sitter-cpp
	cp -f deps/tree-sitter-cpp/queries/highlights.scm ~/.local/share/nvim/site/queries/cpp/
	cp -f deps/tree-sitter-cpp/queries/injections.scm ~/.local/share/nvim/site/queries/cpp/
	cp -f deps/tree-sitter-cpp/queries/tags.scm ~/.local/share/nvim/site/queries/cpp/
