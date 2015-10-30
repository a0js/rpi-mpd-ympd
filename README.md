# rpi-mpd-ympd
MPD powered web/lan radio on raspberry pi, with ympd front end control.
So far supports only one external connection before skipping on RPi B+.

## Usage
```bash
docker run -d -p 8080:8080 -p 8000:8000 -v /path/to/music:/var/lib/mpd/music --name mpd a0js/rpi-mpd-ympd
```
### Web Controls
Point your browser to `http://hostmachine:8080`

### Listening
This uses FLAC stream to reduce CPU usage. Open `http://hostmachine:8000` in VLC or other FLAC stream compatible client.

## Gotchas
USB drives fromatted for windows (NTFS) requires `ntfs-3g` package to mount correctly on the rpi host machine.
