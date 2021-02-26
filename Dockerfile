FROM  ubuntu:latest

WORKDIR /usr/src

COPY enviroplus_exporter/enviroplus_exporter.py enviroplus_exporter.py

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-smbus \
    python3-pil \
    libatlas-base-dev \
    python3-dev \
    python3-setuptools \
    python3-numpy

RUN pip3 install \
    enviroplus \
    requests \
    spidev \
    RPi.GPIO \
    prometheus_client

CMD ["python3", "enviroplus_exporter.py", "--factor", "2.25"]
