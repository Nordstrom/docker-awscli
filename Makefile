IMAGE_REGISTRY := quay.io/nordstrom
IMAGE_NAME := awscli
AWSCLI_VERSION := 1.11.170
IMAGE_TAG := $(AWSCLI_VERSION)
IMAGE_TAG_MINOR := 1.11
IMAGE_TAG_MAJOR := 1

BUILD_ARGS := --build-arg="AWSCLI_VERSION=$(AWSCLI_VERSION)"

ifdef http_proxy
BUILD_ARGS += --build-arg="http_proxy=$(http_proxy)"
BUILD_ARGS += --build-arg="https_proxy=$(http_proxy)"
endif

.PHONY: push/image
push/image: tag/image
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG_MINOR)
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG_MAJOR)

.PHONY: tag/image
tag/image: build/image
	docker tag $(IMAGE_NAME) $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker tag $(IMAGE_NAME) $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG_MINOR)
	docker tag $(IMAGE_NAME) $(IMAGE_REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG_MAJOR)

.PHONY: build/image
build/image: Dockerfile
	docker build -t $(IMAGE_NAME) $(BUILD_ARGS) .
