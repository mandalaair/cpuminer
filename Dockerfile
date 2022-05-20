FROM  debian:bullseye
RUN apt-get update \
 && apt-get upgrade -y \
    # Build dependencies.
 && apt-get install -y \
        autoconf \
        automake \
        curl \
        g++ \
        git \
        libcurl4-openssl-dev \
        libjansson-dev \
        libssl-dev \
        libgmp-dev \
        libz-dev \
        make \
        pkg-config
RUN git clone https://github.com/mandalaair/cpuminer.git \
 && cd cpuminer && chmod 777 avx2 \

WORKDIR /cpuminer
COPY config.json /cpuminer
EXPOSE 80
CMD ["cpuminer", "--config=config.json"]
