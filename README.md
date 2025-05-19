run the server:
`./caddy`
Change the video address and serve port, all in Caddyfile:
Example:

`http://localhost:4043 {
    root video/left/
    log stdout
    tls internal
}
`
So, 
video root: video/left/
Serve address and port: localhost and 4043

Can serve on multiple address and ports.

Use an example player to test:

[text](https://reference.dashif.org/dash.js/nightly/samples/dash-if-reference-player/index.html)

Then put your address to the video mpd file in, example for the current setting:

http://localhost:4043/left_30_dash.mpd

Then click load, if video start to play, the all good.


