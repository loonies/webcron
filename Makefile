.SUFFIXES:

SHELL = /bin/sh

bindir = /usr/bin
etcdir = /etc/webcron
sysdir = /usr/lib/systemd/system

RM      = rm -f
INSTALL = install

.PHONY: help
help:
	@echo "Usage: make [<options>] [<target>]"
	@echo ""
	@echo "Targets:"
	@echo "  help       Display help"
	@echo "  install    Install program"
	@echo "  uninstall  Uninstall program"

.PHONY: install
install:
	$(INSTALL) -m 0755 src/webcron $(bindir)
	$(INSTALL) -m 0644 src/webcron@.service $(sysdir)
	$(INSTALL) -m 0644 src/webcron@.timer $(sysdir)
	$(INSTALL) -m 0644 src/config/*.conf $(etcdir)

.PHONY: uninstall
uninstall:
	$(RM) $(bindir)/webcron
	$(RM) $(sysdir)/webcron@.service
	$(RM) $(sysdir)/webcron@.timer
