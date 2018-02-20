FROM debian:stretch

RUN set -e;\
  apt-get update;\
  apt-get install \
    build-essential \
    ca-certificates \
    curl \
    dh-autoreconf \
    git \
    gzip \
    libpq-dev \
    postgresql \
    postgresql-client \
    python \
    ssh \
    tar \
    unzip \
  -y;\
  apt-get --purge autoremove;\
  apt-get clean;\
  curl -sSL https://get.haskellstack.org/ | sh;
