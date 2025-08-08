FROM nvidia/cuda:12.2.2-devel-ubuntu20.04

RUN rm /etc/apt/sources.list.d/cuda.list

RUN apt update \ 
    && apt -y install wget \
    && wget https://github.com/rigelminer/rigel/releases/download/1.22.2/rigel-1.22.2-linux.tar.gz \
    && tar xvzf rigel-1.22.2-linux.tar.gz \
    && rm rigel-1.22.2-linux.tar.gz \
    && ln -s libnvidia-ml.so.1 /lib/x86_64-linux-gnu/libnvidia-ml.so \
    && ln -s libcuda.so.1 /lib/x86_64-linux-gnu/libcuda.so
    
WORKDIR /rigel-1.22.2-linux

ENTRYPOINT ["./rigel"]
