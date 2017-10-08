FROM resin/raspberry-pi-python:3

LABEL maintainer "Philipp Schmitt <philipp@schmitt.co>"

# RUN apt-get update && \
#     apt-get install -y build-essential libglib2.0-dev && \
#     pip install https://github.com/ChristiafKuehnel/plantgateway/archive/master.zip && \
#     apt-get remove --purge -y build-essential libglib2.0-dev && \
#     mkdir /config && \
#     ln -s /config/plantgw.yaml /root/.plantgw.yaml && \
#     apt-get autoremove -y && \
#    rm -rf /var/lib/apt/lists/*

RUN pip install https://github.com/ChristianKuehnel/plantgateway/archive/master.zip && \
    ln -s /config/plantgw.yaml /root/.plantgw.yaml

VOLUME ["/config"]
WORKDIR /config

ENTRYPOINT ["/usr/local/bin/plantgateway"]
