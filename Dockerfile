FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tijmenvandenbrink/enviroplus_exporter.git /enviroplus_exporter

WORKDIR /enviroplus_exporter

RUN pip3 install -r requirements.txt

CMD python3 enviroplus_exporter.py --bind=0.0.0.0 --port=8000 --factor=3
