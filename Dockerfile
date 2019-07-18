FROM python:3.6-alpine
LABEL author="docker+containers@cyberpunk.net.ar + https://github.com/noelleleigh/"

ARG UID=1000
ARG GID=1000

ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV USER glitch
ENV HOME /app

RUN apk add --no-cache \
       --virtual build-deps git python3-dev build-base \
       linux-headers jpeg-dev zlib-dev \
    && apk add --no-cache libjpeg-turbo \
    && pip install -U pip 'Pillow>=5' 'tqdm>=4' \
    && git clone https://github.com/noelleleigh/glitch_me /glitch_me \
    && pip install -e /glitch_me \
    && rm -fr /glitch_me/.cache \
    && apk --purge del build-deps \
    && addgroup -S $USER -g $GID \
    && adduser -S -G $USER -u $UID -h $HOME $USER

WORKDIR /app
USER $USER
ENTRYPOINT ["glitch_me"]
