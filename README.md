# docker-mosquitto
Mosquitto Docker image with SSL/TLS support

## Download and build
``` 
git clone https://github.com/filipnet/docker-mosquitto.git
cd docker-mosquitto
docker build .
```

## Create Docker bind mounts

You should create similar folders on your host system if you want to use bind mounts, e.g.:
```
mkdir -p /data/docker/mosquitto/{config,data,log}
```
and change ownership to our former created mosquitto user:
```
chown -R mosquitto:mosquitto /data/docker/mosquitto
```
Place mosquitto.conf in ```/data/docker/mosquitto/config/```

# Deployment
The contents of a Dockerfile describe how to create and build a Docker image, while docker-compose is a command that runs Docker containers based on settings described in a docker-compose.yaml file.

## Build docker image
```
docker build -t filipnet/mosquitto:latest .
```

## Build docker image and create container 
```
docker run -ti -p 1883:1883 -p 9001:9001 \
-v /data/docker/mosquitto/config:/mosquitto/config:ro \
-v /data/docker/mosquitto/log:/mosquitto/log \
-v /data/docker/mosquitto/data/:/mosquitto/data/ \
--name mosquitto filipnet/mosquitto
```

## Build by using docker-compose 
The docker-compose up command creates a container parameterized according to the YAML file and then runs it. That command then uses the docker-compose.yaml file to run a container
A docker-compose.yaml file can reference a Dockerfile, but a Dockerfile can’t reference a docker-compose file.
```
docker-compose up -d --pull
```
