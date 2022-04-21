FROM --platform=linux/amd64 bufbuild/buf:1.3.1

RUN apk add --update --no-cache \
      nodejs=16.14.2-r0 \
      npm=8.1.3-r0 \
      wget \
      gcompat && \
    wget https://dl-cdn.alpinelinux.org/alpine/v3.14/main/x86_64/ruby-2.7.6-r0.apk && \
    apk add ruby-2.7.6-r0.apk --repository=https://dl-cdn.alpinelinux.org/alpine/v3.14/main && \
    rm -rf ruby-2.7.6-r0.apk /var/cache/apk/*

ARG TS_PROTO_VERSION=1.110.4
ARG RUBY_GEM_GRPC_TOOLS_VERSION=1.41.1

RUN npm i -g ts-proto@${TS_PROTO_VERSION} && \
    gem install grpc-tools -v ${RUBY_GEM_GRPC_TOOLS_VERSION}

ENTRYPOINT ["/usr/local/bin/buf"]
