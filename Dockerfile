FROM alpine:latest
MAINTAINER Charlie Gildawie <charlie@skyscanner.net>

LABEL org.label-schema.name="Go-Httpbin" \
      org.label-schema.description="GoLang version of HttpBin" \
      org.label-schema.url="https://github.com/ahmetb/go-httpbin" \
      org.label-schema.vcs-url="https://github.com/Skyscanner/docker-go-httpbin" \
      org.label-schema.schema-version="1.0"

RUN mkdir /gobuild
ENV GOPATH /gobuild
WORKDIR ${GOPATH}

RUN echo "-- Setup workarea and toolchain ------------" \
 && apk add --update git go g++ curl\

 && echo "-- Collect go-httpbin and build it ---------" \
 && mkdir -p src/github.com/ahmetb/ \
 && mkdir bin \
 && git clone https://github.com/Skyscanner/go-httpbin.git src/github.com/ahmetb/go-httpbin 
 
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN curl https://glide.sh/get | sh \
 && cd $GOPATH/src/github.com/ahmetb/go-httpbin \
 && glide install \
 && cd $GOPATH/src \
 && go get github.com/ahmetb/go-httpbin/cmd/httpbin/ \
 && mv $GOPATH/bin/httpbin /usr/bin/httpbin \

 && echo "-- Cleanup ---------------------------------" \
 && rm -rf $GOPATH \
 && apk del git go g++ curl

ENTRYPOINT ["/usr/bin/httpbin", "-host",  "0.0.0.0:8080"]
