FROM ubuntu:bionic
WORKDIR /
COPY circle-3.1 circle-3.1
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential && \
        cd /circle-3.1 && \
        ./configure && \
        cd src && \
        touch .accepted && \
        make

FROM alpine
WORKDIR /circle-3.1
COPY --from=0 /circle-3.1 .
EXPOSE 4000
VOLUME /circle-3.1/lib
CMD [ "./autorun.sh" ]
