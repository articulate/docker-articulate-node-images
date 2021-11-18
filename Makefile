all: 12-stretch-slim 14-stretch-slim 16-stretch-slim
.PHONY: all

12-stretch-slim:
	docker build -t local/articulate-node-images:12 12-stretch-slim/
.PHONY: 12-stretch-slim

14-stretch-slim:
	docker build -t local/articulate-node-images:14 14-stretch-slim/
.PHONY: 14-stretch-slim

16-stretch-slim:
	docker build -t local/articulate-node-images:16 16-stretch-slim/
.PHONY: 16-stretch-slim
