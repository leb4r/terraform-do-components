.PHONY: clean test

clean:
	@find . \( -name .terraform.lock.hcl -type f \) -o \( -name .terraform -type d \)| xargs rm -rfv

test:
	make -C test
