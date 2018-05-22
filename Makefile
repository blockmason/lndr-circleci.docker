.PHONY: build publish

IMAGE_NAME=blockmason/lndr-circleci
IMAGE_VERSION=1.0.2
IMAGE_TAG=${IMAGE_NAME}:${IMAGE_VERSION}

build:
	docker build -t "${IMAGE_TAG}" .

publish:
	docker push "${IMAGE_TAG}"
