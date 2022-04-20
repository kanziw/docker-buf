FROM bufbuild/buf:1.3.1

RUN apk add --update --no-cache \
    nodejs=16.14.2-r0 \
    npm=8.1.3-r0 && \
  rm -rf /var/cache/apk/*

ARG TS_PROTO_VERSION=1.110.4

RUN npm i -g ts-proto@${TS_PROTO_VERSION}

ENTRYPOINT ["/usr/local/bin/buf"]
