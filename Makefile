LOG_LEVEL ?= spin=trace
CERT_NAME ?= local
SPIN_DOC_NAME ?= new-doc.md

ARCH = $(uname -p)
## dependencies for e2e-tests
E2E_VOLUME_MOUNT     ?=
E2E_BUILD_SPIN       ?= false
E2E_TESTS_DOCKERFILE ?= e2e-tests.Dockerfile
MYSQL_IMAGE          ?= mysql:8.0.22
REDIS_IMAGE          ?= redis:7.0.8-alpine3.17
POSTGRES_IMAGE       ?= postgres:14.7-alpine

## overrides for aarch64
ifneq ($(ARCH),x86_64)
	MYSQL_IMAGE 		 = arm64v8/mysql:8.0.32
	REDIS_IMAGE 		 = arm64v8/redis:6.0-alpine3.17
	POSTGRES_IMAGE 		 = arm64v8/postgres:14.7
	E2E_TESTS_DOCKERFILE = e2e-tests-aarch64.Dockerfile
endif

.PHONY: build
build:
	echo $(ARCH)
