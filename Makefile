.PHONY: build
## build: build Docker image from Dockerfile
build:
	docker build . -t kanziw/buf:dev


.PHONY: help
## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':'
