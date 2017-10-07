FROM node:latest

MAINTAINER Corentin Kerisit "c@42.am"

RUN echo deb http://ftp.debian.org/debian/ jessie main contrib non-free > /etc/apt/source.list

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig

RUN mkdir /data && \
    cd /data && \
    git clone https://github.com/beyazkemal/prerender.git && \
    cd prerender && \
    npm install

CMD ["node", "/data/prerender/server.js"]
