# rpi-mpd-ympd
MPD powered web/lan radio on raspberry pi, with ympd front end control.

## Usage
```bash
docker run -d -p 8080:8080 -p 8000:8000 -v /path/to/music:/var/lib/mpd/music --name mpd a0js/rpi-mpd-ympd
```
You can specify an encoder to use with the environment variable `ENCODER`
```bash
docker run -d -p 8080:8080 -p 8000:8000 -e "ENCODER=flac" -v /path/to/music:/var/lib/mpd/music --name mpd a0js/rpi-mpd-ympd
```
Defaults to `lame` (mp3). See all options in [MPD Docs](http://www.musicpd.org/doc/user/encoder_plugins.html)

### Web Controls
Point your browser to `http://hostmachine:8080`

### Listening
Open `http://hostmachine:8000` in VLC or other client.

## Gotchas
USB drives fromatted for windows (NTFS) requires `ntfs-3g` package to mount correctly on the rpi host machine.

Using flac encoder will reduce cpu usage significantly however it will also increase network traffic.

On Raspberry Pi B+
MP3 - ~60% CPU - 96kb/s stream
FLAC - ~15% CPU - ~960kb/s stream

If listening outside your home network, your ISP upload speed might not be enough to run FLAC.

Also few clients can play FLAC streams, VLC will work though.
