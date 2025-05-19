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



