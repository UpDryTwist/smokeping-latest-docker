
.PHONY: help docker-build docker-publish

BASE_IMAGE  = lscr.io/linuxserver/smokeping:latest
DOCKER_REPO = registry.supercroy.com/updrytwist
DOCKER_PROJ = smokeping-updrytwist

define get_version
$(shell docker pull -q $(BASE_IMAGE) >/dev/null 2>&1 && \
	docker inspect $(BASE_IMAGE) | grep -i "image.version" | awk '{print $$2}' | sed 's/"//g')
endef

VERSION := $(call get_version)

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  docker-build    to build docker image"
	@echo "  docker-publish  to publish docker image"

docker-build:
	@docker build -t $(DOCKER_PROJ):$(VERSION) .

docker-publish: docker-build
	@docker tag $(DOCKER_PROJ):$(VERSION) $(DOCKER_REPO)/$(DOCKER_PROJ):$(VERSION)
	@docker push $(DOCKER_REPO)/$(DOCKER_PROJ):$(VERSION)
	@docker tag $(DOCKER_PROJ):$(VERSION) $(DOCKER_REPO)/$(DOCKER_PROJ):latest
	@docker push $(DOCKER_REPO)/$(DOCKER_PROJ):latest

