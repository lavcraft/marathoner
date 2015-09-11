FROM golang:1.5-wheezy

ADD ./src/ /go/src
RUN GOPATH=/go go get github.com/lavcraft/marathoner/...

ENTRYPOINT ["/go/bin/logger"]
