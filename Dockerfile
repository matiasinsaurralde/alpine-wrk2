FROM alpine:3.3

WORKDIR /opt

RUN apk add --no-cache curl alpine-sdk

RUN apk --update add --virtual build-dependencies alpine-sdk openssl openssl-dev curl \
    && curl "https://github.com/giltene/wrk2/archive/master.zip" -L -o master.zip \
    && unzip master.zip \
    && mv wrk2-master wrk2

WORKDIR /opt/wrk2

RUN make

RUN mv wrk /usr/bin

RUN apk del build-dependencies

RUN wrk
