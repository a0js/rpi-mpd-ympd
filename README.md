# rpi-mpd-ympd
MPD powered web/lan radio on raspberry pi, with ympd front end control.
So far supports only one external connection before skipping on RPi B+.

## Usage
```bash
docker run -d -p 8080:8080 -p 8000:8000 -v /path/to/music:/var/lib/mpd/music --name mpd a0js/rpi-mpd-ympd
```
## Gotchas
USB drives fromatted for windows (NTFS) requires `ntfs-3g` package to mount correctly
