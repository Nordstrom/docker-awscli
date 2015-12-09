container_name := awscli
container_registry := nordstrom
container_release := 1.9.10

.PHONY: build tag release

build: Dockerfile $(build_container_prereqs)
	docker build -t $(container_name) --build-arg AWSCLI_RELEASE=$(container_release) .

tag: build
	docker tag -f $(container_name) $(container_registry)/$(container_name):$(container_release)

release: tag
	docker push $(container_registry)/$(container_name):$(container_release)
