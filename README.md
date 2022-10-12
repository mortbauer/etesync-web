# etesync-web docker image

This repo is the source to build the docker container of the web frontend for
etesync.

It accepts one build argument: `VERSION` which is the used
[etesync-web](https://github.com/etesync/etesync-web) version.

To run it set the env variable`ETESYNC_API_PATH` to point it to the correct backend.

```
docker run --rm -it -p 80:80 -e ETESYNC_API_PATH=https://<your etbase api>
```
