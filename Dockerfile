FROM ubuntu:bionic
WORKDIR /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential \
        ca-certificates \
        wget && \
        wget https://www.circlemud.org/pub/CircleMUD/3.x/circle-3.1.tar.gz && \
        tar -zxvf circle-3.1.tar.gz && \
        cd circle-3.1 && \
        ./configure && \
        cd src && \
        touch .accepted && \
        make

FROM ubuntu:bionic
WORKDIR /circle-3.1
COPY --from=0 /circle-3.1 .
EXPOSE 4000
CMD [ "./autorun.sh" ]
