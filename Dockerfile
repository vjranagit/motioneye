FROM alpine:3.7

ENV motioneye_version=0.40
ENV motion_tag=release-4.2
ENV UID=1000
ENV GID=100

VOLUME ["/etc/motioneye", "/var/lib/motioneye"]
COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add\
    bash\
    ffmpeg-dev\
    jpeg-dev\
    libmicrohttpd-dev\
    py2-pip\
    python\
    curl\
    openssl\
    tzdata\
    v4l-utils\
&&  apk --no-cache add --virtual=buildreq\
    autoconf\
    automake\
    build-base\
    curl-dev\
    git\
    libtool\
    openssl-dev\
    python-dev\
    zlib-dev\
&&  git clone https://github.com/Motion-Project/motion.git && cd motion\
&&  git checkout tags/$motion_tag\
&&  autoreconf -fiv\
&&  ./configure\
&&  make\
&&  make install\
&&  pip install motioneye==$motioneye_version\
&&  apk del buildreq\
&&  chmod +x /entrypoint.sh

CMD /entrypoint.sh /usr/bin/meyectl startserver -c /etc/motioneye/motioneye.conf

EXPOSE 8765
