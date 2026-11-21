FILES?= 
FILES+= /etc/portage/env/O3                                \
		/etc/portage/env/llvm                              \
		/etc/portage/env/lto                               \
		/etc/portage/env/single                            \
		/etc/portage/repos.conf/eselect-repo.conf          \
		/etc/portage/package.accept_keywords/unstable      \
		/etc/portage/package.env                           \
		/etc/portage/package.license                       \
		/etc/portage/package.mask/broken                   \
		/etc/portage/package.use/10-core                   \
		/etc/portage/package.use/20-static                 \
		/etc/portage/package.use/20-test                   \
		/etc/portage/package.use/20-xorg                   \
		/etc/portage/package.use/30-misc                   \
		/etc/portage/package.use/50-llvm                   \
		/etc/portage/package.use/50-lua                    \
		/etc/portage/package.use/50-python                 \
		/etc/portage/package.use/50-qemu                   \
		/etc/portage/package.use/50-ruby                   \
		/etc/portage/package.use/50-steam                  \
		/etc/portage/sets/desktop                          \
		/etc/portage/sets/kernel                           \
		/etc/portage/sets/main
FILES+=$(patsubst etc/portage/%,/etc/portage/%,$(shell find etc/portage/patches -type f))

.PHONY: install
install: portage-install-config portage-sync-repos

.PHONY: portage-install-config
portage-install-config: $(FILES)

.PHONY: portage-sync-repos
portage-sync-repos: portage-install-config portage-install-bootstrap
	@REPOS=$$(portageq get_repos / | xargs -n1 | grep -vxF gentoo \
                             | grep -vxF local | xargs);          \
	emerge --ignore-default-opts -v --sync $${REPOS[@]}

.PHONY: portage-install-bootstrap
portage-install-bootstrap:
	@emerge -1uqDN dev-lang/rust-bin \
				   dev-vcs/git       \
				   llvm-core/clang

/etc/portage/%: etc/portage/% portage-install-bootstrap
	@mkdir -p $(dir $@)
	@cp -v $< $@
