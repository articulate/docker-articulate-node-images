PREFIX ?= local

help:
	@echo "+ $@"
	@grep -hE '(^[a-zA-Z0-9\._-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m## /[33m/'
.PHONY: help

all: 12 14 16 ## Build all images
.PHONY: all

##
## 12
## ----------------------------------------------------------------------------

12: 12-stretch-slim 12-buster-slim ## Build all Node 12 images
.PHONY: 12

12-stretch-slim: ## Build 12-stretch-slim
	docker build -t $(PREFIX)/articulate-node-images:12-stretch-slim 12/stretch-slim/
.PHONY: 12-stretch-slim

12-buster-slim: ## Build 14-stretch-slim
	docker build -t $(PREFIX)/articulate-node-images:12-buster-slim 12/buster-slim/
.PHONY: 12-buster-slim

##
## 14
## ----------------------------------------------------------------------------

14: ## Build all Node 14 images

14-stretch-slim: ## Build 14-stretch-slim
	docker build -t $(PREFIX)/articulate-node-images:14-stretch-slim 14/stretch-slim/
.PHONY: 14-stretch-slim

14-buster-slim: ## Build 14-buster-slim
	docker build -t $(PREFIX)/articulate-node-images:14-buster-slim 14/buster-slim/
.PHONY: 14-buster-slim

##
## 16
## ----------------------------------------------------------------------------

16-stretch-slim: ## Build 16-stretch-slim
	docker build -t $(PREFIX)/articulate-node-images:16-stretch-slim 16/stretch-slim/
.PHONY: 16-stretch-slim

16-buster-slim: ## Build 16-buster-slim
	docker build -t $(PREFIX)/articulate-node-images:16-buster-slim 16/buster-slim/
.PHONY: 16-buster-slim

16-bullseye-slim:
	docker build -t $(PREFIX)/articulate-node-images:16-bullseye-slim 16/bullseye-slim/
.PHONY: 16-bullseye-slim