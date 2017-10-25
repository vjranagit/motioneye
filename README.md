# tyzbit/motion

This is the popular `motioneye` Linux app, Dockerized and on [Alpine](https://alpinelinux.org/about/).

Run it
------
    docker run -p 8765:8765 -v /path/to/config:/etc/motioneye -v /path/to/data:/var/lib/motioneye tyzbit/motion

If you mount a config volume with a `motioneye.conf` file inside, it will override the defaults.

If you want to save videos, mount a data directory.
