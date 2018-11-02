FROM alpine:3.7

ENV version=0.39.3
ENV UID=1000
ENV GID=100

VOLUME ["/etc/motioneye", "/var/lib/motioneye"]
COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add\
    bash\
    py2-pip\
    python\
    curl\
    openssl\
    tzdata\
&&  apk --no-cache add --virtual=buildreq\
    autoconf\
    automake\
    build-base\
    curl-dev\
    ffmpeg-dev\
    git\
    jpeg-dev\
    libtool\
    libmicrohttpd-dev\
    openssl-dev\
    python-dev\
    zlib-dev\
&&  git clone https://github.com/Motion-Project/motion.git && cd motion\
&&  autoreconf -fiv\
&&  ./configure\
&&  make\
&&  make install\
&&  pip install motioneye==$version\
&&  apk del buildreq\
&&  chmod +x /entrypoint.sh

CMD /entrypoint.sh /usr/bin/meyectl startserver -c /etc/motioneye/motioneye.conf

EXPOSE 8765
