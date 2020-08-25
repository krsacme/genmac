# Copied from coreos-assembler
GOARCH := $(shell uname -m)
ifeq ($(GOARCH),x86_64)
	GOARCH = amd64
else ifeq ($(GOARCH),aarch64)
	GOARCH = arm64
endif

# vim: noexpandtab ts=8
export GOPATH=$(shell echo $${GOPATH:-$$HOME/go})
export GO111MODULE
export GOPROXY=https://proxy.golang.org

export OVSDPDK_GO_PACKAGE=github.com/krsacme/ovsdpdk-network-operator

#### TARGETS
default: build

build: genmac

genmac:
	WHAT=genmac hack/build-go.sh

check test:
	hack/test-go.sh ${PKGS}

.PHONY: clean
clean:
	@rm -rf _output
