FROM hypriot/rpi-alpine-scratch
MAINTAINER Ammon Sarver <manofarms@gmail.com>

RUN apk update && apk upgrade && apk add \
  bash \
  sudo \
  mpd \
  ympd

RUN mkdir -p /var/lib/mpd/music \
  && mkdir -p /var/lib/mpd/playlists \
  && touch /var/lib/mpd/state \
  && touch /var/lib/mpd/tag_cache \
  && chmod 777 -R /var/lib/mpd \
  && chown -R mpd /var/lib/mpd 

COPY mpd.conf /etc/mpd.conf
COPY start.sh /start.sh

EXPOSE 8080 8000 6600
ENTRYPOINT ["/start.sh"]
