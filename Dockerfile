FROM docker
RUN apk --update --no-cache add \
    tini \
    openssh-client \
    ca-certificates \
    bash \
    cargo \
    git \
    make \
    curl \
    jq \
    rsync \
    python3 \
    python3-dev \
    py-pip \
    build-base \
    protobuf \
    libffi-dev \
    gcc \
    libc-dev \
    openssl-dev \
    util-linux \
    gettext \
    && pip install --upgrade pip \
    && pip install docker-compose \
    && update-ca-certificates

COPY Dockerfile /Dockerfile
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/alersrt/ci-builder"

ENTRYPOINT ["/sbin/tini", "--"]
