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
    libtinfo-dev \
    postgresql \
    postgresql-client \
    python \
    ssh \
    tar \
    unzip \
  -y;\
  apt-get --purge autoremove;\
  apt-get clean;\
  (\
    ARCHIVE_FILE="$(mktemp awscli-XXXXX.zip)";\
    curl -sSL 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip' -o "${ARCHIVE_FILE}";\
    unzip "${ARCHIVE_FILE}";\
    rm -vf "${ARCHIVE_FILE}";\
  );\
  awscli-bundle/install -i /usr/share/aws -b /bin/aws;\
  rm -vfR awscli-bundle;\
  curl -sSL https://get.haskellstack.org/ | sh;
