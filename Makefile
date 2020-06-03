default: build_10 build_12

build_10:
	docker build -t local/articulate-node-images:10 10-stretch-slim/

build_12:
	docker build -t local/articulate-node-images:12 12-stretch-slim/
