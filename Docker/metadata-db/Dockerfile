## Golang
FROM golang:alpine
LABEL MAINTAINER="UTD" INFO="Kubernetes"

WORKDIR /

COPY metadata /metadata
COPY go.mod /go.mod
COPY main.go /main.go


RUN apk add --no-cache curl ca-certificates
RUN go build -o /

EXPOSE 80

CMD ["/metadata-db"]
