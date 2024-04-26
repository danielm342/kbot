APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=danielmakarov
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH=amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v
 
get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="github.com/danielm342/kbot/cmd.appVersion=${VERSION}

linux: 
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o kbot -ldflags "-X="github.com/danielm342/kbot/cmd.appVersion=${VERSION}

linux_arm: 
	 CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o kbot -ldflags "-X="github.com/danielm342/kbot/cmd.appVersion=${VERSION}

darwin: 
	 CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o kbot -ldflags "-X="github.com/danielm342/kbot/cmd.appVersion=${VERSION}

darwin_arm: 
	 CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -v -o kbot -ldflags "-X="github.com/danielm342/kbot/cmd.appVersion=${VERSION}

windows: 
	 CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o kbot -ldflags "-X="github.com/danielm342/kbot/cmd.appVersion=${VERSION}

image:
	docker build  --platform ${TARGETOS}/${TARGETARCH} . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGETARCH}

clean:
	rm -rf kbot
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}