FROM alpine:latest
MAINTAINER Charlie Gildawie <charlie@skyscanner.net>

ARG VCS_REF
ARG BUILD_DATE
ARG VERSION

LABEL org.label-schema.name="Go-Httpbin" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.description="GoLang version of HttpBin" \
      org.label-schema.url="https://github.com/ahmetb/go-httpbin" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/Skyscanner/docker-go-httpbin" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

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
