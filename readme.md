## Required "Volume" - /etc/bind

[ REQUIRED ] In your /etc/bind a file "named.conf", which acts as an entry point to your configs

## Run BIND Container:
```
docker run --name=dns01 -d -p 53:53/udp -p 53:53 \
-v /dns/etc/bind:/etc/bind \
romanlum/rpi-named
```
