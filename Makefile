image_registry := quay.io/nordstrom
image_name := awscli
awscli_version := 1.10.62
image_release := $(awscli_version)

proxy_url := http://webproxy.nordstrom.net:8181
build_args ?= --build-arg AWSCLI_VERSION=$(awscli_version) --build-arg http_proxy=$(proxy_url) --build-arg https_proxy=$(proxy_url)

.PHONY: build/image tag/image push/image

build/image:
	docker build -t $(image_name) $(build_args) .

tag/image: build/image
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push/image: tag/image
	docker push $(image_registry)/$(image_name):$(image_release)
