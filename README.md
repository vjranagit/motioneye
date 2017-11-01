# tyzbit/motion

This is the popular `motioneye` Linux app, Dockerized and on [Alpine](https://alpinelinux.org/about/).

Tags
----
`latest`, `3.6` - This is based off of Alpine 3.6, and has Python 2.7.14. [(Dockerfile)](https://github.com/tyzbit/motioneye/blob/3.6/Dockerfile)
`edge` - This is based off of Alpine Edge, and has Python 2.7.15.  MotionEye is incompatible with this version of Python, but once it's updated this image will be updated as well. [(Dockerfile)](https://github.com/tyzbit/motioneye/blob/master/Dockerfile)


Run it
------
    docker run -p 8765:8765 \
    -v /path/to/config:/etc/motioneye \
    -v /path/to/data:/var/lib/motioneye \
    -e UID=1000 \
    -e GID=100 \
    -e TZ="America/New_York" \
    tyzbit/motion

If you mount a config volume with a `motioneye.conf` file inside, it will override the defaults, as seen above.

If you want to save videos, mount a data directory, as seen above.

If you need a specific UID and/or GID, add `-e UID:1000 -e GID:100` to your `docker run` command
