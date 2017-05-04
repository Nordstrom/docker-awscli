IMAGE_NAME := awscli
IMAGE_REGISTRY := quay.io/nordstrom
AWSCLI_VERSION := 1.11.82
IMAGE_RELEASE := $(AWSCLI_VERSION)-0

BUILD_ARGS := --build-arg="AWSCLI_VERSION=$(AWSCLI_VERSION)"

ifdef http_proxy
BUILD_ARGS += --build-arg="http_proxy=$(http_proxy)"
BUILD_ARGS += --build-arg="https_proxy=$(http_proxy)"
endif

.PHONY: build/image tag/image push/image

build/image: Dockerfile
	docker build -t $(IMAGE_NAME) $(BUILD_ARGS) .

tag/image: build/image
	docker tag $(IMAGE_NAME) $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_RELEASE)

push/image: tag/image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_RELEASE)
