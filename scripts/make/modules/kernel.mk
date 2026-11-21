.PHONY: install
install: kernel-install-config

.PHONY: kernel-install-config
kernel-install-config: /etc/kernel/config.d/00-default.config       \
						/etc/kernel/config.d/10-llvm.config         \
						/etc/kernel/config.d/10-kexec.config        \
						/etc/kernel/config.d/10-optimize.config     \
						/etc/kernel/config.d/20-filesystems.config  \
						/etc/kernel/config.d/20-storage.config      \
						/etc/kernel/config.d/40-native-cpu.config   \
						/etc/kernel/config.d/60-platform.config

/etc/kernel/config.d/%.config: etc/kernel/config.d/%.config
	@mkdir -p /etc/kernel/config.d/
	@cp -v $< $@
