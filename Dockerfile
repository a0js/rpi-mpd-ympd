FROM resin/rpi-raspbian
MAINTAINER Ammon Sarver <manofarms@gmail.com>

RUN apt-get -qq update --fix-missing \
  && apt-get install \
  --no-install-recommends \
  --no-install-suggests \
  -y \
  sudo \
  mpd \
  wget \
  bzip2 \  
  && rm -rf /var/lib/apt/lists/*

RUN wget http://www.ympd.org/downloads/ympd-1.2.3-armhf.tar.bz2 \
  && tar -xvf ympd-1.2.3-armhf.tar.bz2 \
  && rm -rf ympd-1.2.3-armhf.tar.bz2

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
