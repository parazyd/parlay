all:
	@echo Available targets:
	@echo make check
	@echo make update-copyright

check:
	repoman -d full

update-copyright:
	./scripts/update_copyright.sh

.PHONY: all check update-copyright
