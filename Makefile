.PHONY: clean test

clean:
	@find . \( -name .terraform.lock.hcl -type f \) | xargs rm -rfv

test:
	make -C test
