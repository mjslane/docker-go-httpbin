FROM golang:1.8

RUN go get github.com/ahmetb/go-httpbin/cmd/httpbin
CMD $GOPATH/bin/httpbin -host 0.0.0.0:8080
