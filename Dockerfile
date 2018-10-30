FROM docker
RUN apk --update --no-cache add \ 
    tini \
    ca-certificates \ 
    bash \
    git \
    make \
    curl \ 
    rsync \ 
    && update-ca-certificates

COPY Dockerfile /Dockerfile
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/alersrt/ci-builder"

ENTRYPOINT ["/sbin/tini", "--"]
