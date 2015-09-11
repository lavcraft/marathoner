FROM golang:1.5-wheezy

ADD ./src/ /go/src
RUN GOPATH=/go go get github.com/lavcraft/marathoner/...

EXPOSE 7676

ENTRYPOINT ["/go/bin/updater"]
