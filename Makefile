all: 10-stretch-slim 12-stretch-slim 14-stretch-slim
.PHONY: all

10-stretch-slim:
	docker build -t local/articulate-node-images:10 10-stretch-slim/
.PHONY: 10-stretch-slim

12-stretch-slim:
	docker build -t local/articulate-node-images:12 12-stretch-slim/
.PHONY: 12-stretch-slim

14-stretch-slim:
	docker build -t local/articulate-node-images:14 14-stretch-slim/
.PHONY: 14-stretch-slim
