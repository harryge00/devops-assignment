all: build-all

VERSION?=1.0.1
REVIEW_VERSION?=1.1.0

build-airports-assembly:
	# Build image airports-assembly:$(VERSION)
	docker build -t airports-assembly:$(VERSION) airports-assembly/$(VERSION)

build-airports-assembly-new:
	# Build image airports-assembly:$(REVIEW_VERSION)
	docker build -t airports-assembly:$(REVIEW_VERSION) airports-assembly/$(REVIEW_VERSION)

build-countries-assembly:
	# Build image countries-assembly:$(VERSION)
	docker build -t countries-assembly:$(VERSION) countries-assembly

build-all: build-airports-assembly build-airports-assembly-new build-countries-assembly
	# build all the 3 images
run: 
	echo "Create 2 networks"
	docker network create airports
	docker network create countries
	echo "Run containers"	
	docker run -d --net=airports --name=airports  airports-assembly:$(VERSION)
	docker run -d --net=countries --name=countries countries-assembly:$(VERSION)
	docker create -it --net=airports -v ${PWD}/nginx.conf:/etc/nginx/nginx.conf -p 8000:80 --name reverse-proxy nginx
	docker network connect countries reverse-proxy
	docker start reverse-proxy

clean:
	echo "Stopping and removing containers"
	-docker stop reverse-proxy airports countries
	-docker rm reverse-proxy airports countries
	-docker network rm airports countries