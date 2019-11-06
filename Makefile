default: build_8 build_10

build_8:
	docker build -t local/articulate-node-images:8 8-stretch-slim/

build_10:
	docker build -t local/articulate-node-images:10 10-stretch-slim/
