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
	# Not implemented
push:
	# Not implemented