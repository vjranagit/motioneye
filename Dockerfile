FROM alpine:edge

ENV version=0.37.1

VOLUME ["/etc/motioneye", "/var/lib/motioneye"]

COPY motioneye.conf.sample /etc/motioneye/motioneye.conf.sample

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories\
&&  apk --no-cache add\
    bash\
    motion\
    py2-pip\
    python\
    curl\
    openssl\
&&  apk --no-cache add --virtual=buildreq\
    build-base\
    curl-dev\
    jpeg-dev\
    openssl-dev\
    python-dev\
    zlib-dev\
&&  pip install motioneye==$version\
&&  apk del buildreq

CMD test -e /etc/motioneye/motioneye.conf ||\
    cp /etc/motioneye/motioneye.conf.sample /etc/motioneye/motioneye.conf ;\
    /usr/bin/meyectl startserver -c /etc/motioneye/motioneye.conf

EXPOSE 8765
