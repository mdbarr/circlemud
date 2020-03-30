FROM ubuntu:bionic AS build
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        build-essential

WORKDIR /circle-3.1
ADD circle-3.1 .

RUN ./configure && \
        cd src && \
        touch .accepted && \
        make clean && \
        make

FROM ubuntu:bionic
WORKDIR /circle-3.1
COPY --from=build /circle-3.1 .
EXPOSE 4000
VOLUME /circle-3.1/lib
CMD [ "./autorun.sh" ]
