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
RUN ls \
    # Verify
 && avx2 --cputest \
 && avx2 --version

EXPOSE 80
CMD ["avx2", "--config=config.json"]
