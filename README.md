# docker `glitch_me`

`glitch_me` is a project created by [Noelle Leigh](https://github.com/noelleleigh/glitch_me) to add some distortion/glitch effects to images.  
This repo only provides a way to install it inside a Docker _container_.

## how to install?

First build the image.

```
$ env UID=$(id -u) GID=$(id -g) docker-compose build
```

Note: $UID and $GID are environment variables that can be `export`ed as any other environment var.  

Now you can run `glitch_me`
```
$ docker-compose run glitch-me -h
```


## license

WTFPL.

