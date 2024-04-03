FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

RUN rm /etc/apt/sources.list.d/cuda.list

RUN apt update \ 
    && apt -y install wget \
    && wget https://github.com/rigelminer/rigel/releases/download/1.15.1/rigel-1.15.1-linux.tar.gz \
    && tar xvzf rigel-1.15.1-linux.tar.gz \
    && rm rigel-1.15.1-linux.tar.gz

WORKDIR /rigel-1.15.1-linux

ENTRYPOINT ["./rigel"]
