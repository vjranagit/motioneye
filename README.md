# tyzbit/motion

This is the popular `motioneye` Linux app, Dockerized and on [Alpine](https://alpinelinux.org/about/).

Run it
------
    docker run -p 8765:8765 \
    -v /path/to/config:/etc/motioneye \
    -v /path/to/data:/var/lib/motioneye \
    -e UID=1000 \
    -e GID=100 \
    -e TZ="America/New York" \
    tyzbit/motion

If you mount a config volume with a `motioneye.conf` file inside, it will override the defaults, as seen above.

If you want to save videos, mount a data directory, as seen above.

If you need a specific UID and/or GID, add `-e UID:1000 -e GID:100` to your `docker run` command
