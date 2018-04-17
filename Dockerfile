FROM alpine

MAINTAINER Rafael de Elvira <relviratellez@gmail.com>

RUN apk update && apk upgrade
RUN apk add python
RUN apk add curl

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
RUN python "/tmp/get-pip.py"

RUN pip install --upgrade pip
RUN pip install shadowsocks

ENV METHOD aes-256-cfb

ENTRYPOINT /usr/bin/ssserver -k ${PASSWORD} -m ${METHOD}
EXPOSE 8388
