FROM ubuntu:20.04

RUN apt update
#RUN apt upgrade -y

RUN apt install -y tzdata

RUN apt install -y vim \
    git \
    fish \
    wget \
    make \
    ninja-build \
    clang \
    clang-tools \
    clangd \
    clang-tidy \
    clang-format \
    lldb

# need to build rnnoise.
RUN apt install -y automake autoconf libtool

RUN apt install -y cmake

#RUN wget https://cmake.org/files/v3.20/cmake-3.20.0-rc5.tar.gz && \
#    tar xvf cmake-*.tar.gz && \
#    cd cmake-*/ && ./configure && make && make install && \
#    export PATH="/usr/local/bin:$PATH"

RUN apt-get install -y doxygen graphviz

RUN apt-get install -y swig

RUN apt-get install -y build-essential libgl1-mesa-dev libglu1-mesa-dev

#RUN make setup
