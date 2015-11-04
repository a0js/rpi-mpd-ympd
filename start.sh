#!/bin/bash

if [ -z "$ENCODER" ]; then
	ENCODER=lame;
fi
	
sed -i "s/{{encoder}}/${ENCODER}/g" /etc/mpd.conf

mpd
./ympd
