.PHONY: deps test

deps:
	go mod download

test: deps
	go test -v -timeout 60m -run ./...
