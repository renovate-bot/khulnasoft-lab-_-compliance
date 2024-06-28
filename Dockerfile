FROM golang:1.22-alpine3.18 AS builder
MAINTAINER KhulnaSoft

RUN apk update
RUN apk add make
WORKDIR /go
COPY . compliance
RUN cd compliance && make clean && make

FROM alpine:3.18
MAINTAINER KhulnaSoft
COPY --from=builder /go/compliance/compliance /usr/bin/compliance
