FROM resin/raspberry-pi-python:3

LABEL maintainer "Philipp Schmitt <philipp@schmitt.co>"

RUN pip install https://github.com/ChristianKuehnel/plantgateway/archive/master.zip && \
    ln -s /config/plantgw.yaml /root/.plantgw.yaml && \
    apt-get update && \
    apt-get install -y pi-bluetooth && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/config"]
WORKDIR /config

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
