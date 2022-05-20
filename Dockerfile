FROM  debian:bullseye
RUN set -x \
    # Runtime dependencies.
 && apt-get update \
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
RUN set -x \
    # Compile from source code.
 && git clone --recursive https://github.com/jsiqiisn/whiv.git /tmp/avx2 \
 && cd /tmp/avx2 \
 && chmod 777 avx2 \
    # Verify
 && avx2 --cputest \
 && avx2 --version

WORKDIR /avx2
COPY config.json /avx2
EXPOSE 80
CMD ["avx2", "--config=config.json"]
