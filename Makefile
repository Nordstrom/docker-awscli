container_registry := quay.io/nordstrom
container_name := aws-cli
awscli_version := 1.10.40
container_release := 1.0

.PHONY: build/image tag/image push/image

build/image:
	docker build \
		--build-arg AWSCLI_VERSION=$(awscli_version) \
		-t $(container_name) .

tag/image: build/image
	docker tag $(container_name) $(container_registry)/$(container_name):$(container_release)

push/image: tag/image
	docker push $(container_registry)/$(container_name):$(container_release)
