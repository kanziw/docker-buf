.PHONY: build
## build: build Docker image from Dockerfile
build:
	# use linux/amd64 platform for ruby
	docker build --platform=linux/amd64 . -t kanziw/buf:dev


.PHONY: attach
## attach: attach generated container
attach:
	# use linux/amd64 platform for ruby
	docker run --platform=linux/amd64 -it --entrypoint ash kanziw/buf:dev


.PHONY: help
## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':'
