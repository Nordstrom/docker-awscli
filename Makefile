image_registry := quay.io/nordstrom
image_name := awscli
awscli_version := 1.11.30
image_release := $(awscli_version)-1

ifdef http_proxy
build_args := --build-arg="http_proxy=$(http_proxy)"
build_args += --build-arg="https_proxy=$(http_proxy)"
endif

build_args += --build-arg="AWSCLI_VERSION=$(awscli_version)"

.PHONY: build/image tag/image push/image

build/image:
	docker build $(build_args) -t $(image_name) .

tag/image: build/image
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push/image: tag/image
	docker push $(image_registry)/$(image_name):$(image_release)
