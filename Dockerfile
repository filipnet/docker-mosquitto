FROM debian:jessie

RUN apt-get update && apt-get install -y wget && \
    wget -q -O - https://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | gpg --import && \
    gpg -a --export 8277CCB49EC5B595F2D2C71361611AE430993623 | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mosquitto-jessie.list https://repo.mosquitto.org/debian/mosquitto-jessie.list && \
    apt-get update && apt-get install -y mosquitto mosquitto-clients && \
    adduser --system --disabled-password --disabled-login mosquitto

RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log
COPY config /mosquitto/config
RUN chown -R mosquitto:mosquitto /mosquitto 
VOLUME ["/mosquitto/config", "/mosquitto/data", "/mosquitto/log"]

EXPOSE 1883 9001

ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
