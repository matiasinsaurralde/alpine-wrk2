FROM alpine:3.3

WORKDIR /opt

RUN apk --update add --virtual build-dependencies alpine-sdk curl openssl openssl-dev \
    && curl "https://github.com/giltene/wrk2/archive/master.zip" -L -o master.zip \
    && unzip master.zip \
    && mv wrk2-master wrk2 \
    && cd wrk2 \
    && make \
    && mv wrk /usr/bin \
    && apk del build-dependencies

CMD [ "wrk" ]
