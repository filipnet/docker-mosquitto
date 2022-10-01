# docker-mosquitto
Mosquitto Docker image with SSL/TLS support

## Download and build
``` 
git clone https://github.com/filipnet/docker-mosquitto.git
cd docker-mosquitto
docker build .
```

## Local directories
```
mkdir -p /data/docker/mosquitto/config/
mkdir -p /data/docker/mosquitto/data/
mkdir -p /data/docker/mosquitto/log/
```
Place mosquitto.conf in /data/docker/mosquitto/config/

## Build docker image
docker build -t filipnet/mosquitto:latest .

## Build docker image and create container 
```
docker run -ti -p 1883:1883 -p 9001:9001 \
-v /data/docker/mosquitto/config:/mosquitto/config:ro \
-v /data/docker/mosquitto/log:/mosquitto/log \
-v /data/docker/mosquitto/data/:/mosquitto/data/ \
--name mosquitto filipnet/mosquitto
```
