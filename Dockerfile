FROM golang:1.17.2-alpine3.14 as golang

WORKDIR /app

ARG GO_GRPC_GATEWAY_VERSION=v2.6.0

RUN go install \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@${GO_GRPC_GATEWAY_VERSION} \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@${GO_GRPC_GATEWAY_VERSION}


FROM bufbuild/buf:1.0.0-rc6

COPY --from=golang /go/bin/* /usr/local/bin

RUN apk add --update --no-cache \
    nodejs=14.18.1-r0 \
    npm=7.17.0-r0 && \
  rm -rf /var/cache/apk/*

ARG TS_PROTO_VERSION=1.83.1

RUN npm i -g ts-proto@${TS_PROTO_VERSION}

ENTRYPOINT ["/usr/local/bin/buf"]
