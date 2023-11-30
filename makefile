.PHONY: test check

all:	test check

check:
	shellcheck -S warning bin/tunblkctl

test:	
	bats test/
