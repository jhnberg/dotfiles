.DEFAULT_GOAL:= help

PROFILE?=

.PHONY: install
install:
	@$(MAKE) -f scripts/make/profiles/$(PROFILE).mk install

.PHONY: help
help:
	@echo This make file provides some basic utility for installing the
	@echo configuration found in this repository.
	@echo
	@echo Set the PROFILE variable e.g. PROFILE=minimal then run make with the
	@echo install target to install the configuarion files for the given profile.
	@echo for example
	@echo
	@echo make install PROFILE=minimal
