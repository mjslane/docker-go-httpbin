FROM alpine:latest
MAINTAINER Charlie Gildawie <charlie@skyscanner.net>

ENV GOPATH /gobuild
WORKDIR %{GOPATH}

RUN echo "-- Setup workarea and toolchain ------------" \
 && apk add --update git go g++ \

 && echo "-- Collect go-httpbin and build it ---------" \
 && go get github.com/ahmetb/go-httpbin/cmd/httpbin \
 && mv $GOPATH/bin/httpbin /usr/bin/httpbin \

 && echo "-- Cleanup ---------------------------------" \
 && rm -rf $GOPATH \
 && apk del git go g++

ENTRYPOINT ["/usr/bin/httpbin", "-host",  "0.0.0.0:8080"]
