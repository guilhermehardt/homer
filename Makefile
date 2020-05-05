SHELL = /bin/bash

REGISTRY := <DOCKER_REGISTRY>
VERSION ?= latest
IMAGE ?= ops/toolbox

.PHONY: build
build:
	set -eo pipefail; \
	docker build --force-rm --no-cache -t $(REGISTRY)/$(IMAGE):$(VERSION) .

.SILENT: push
push:build
push:
	set -eo pipefail; \
	docker push $(REGISTRY)/$(IMAGE):$(VERSION);