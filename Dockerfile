# This docker file is for the automated build on docker hub
FROM ubuntu:16.04

LABEL maintainer="e_ben_75-python@yahoo.com" \
      description="This is a simple Syslog Server" \
      package-name="rsyslog" \
      image-version="1.0"

RUN apt-get update \
    && apt-get install -y rsyslog \
    && apt-get clean \
    && mkdir /Syslog \
    && chgrp syslog /Syslog \
    && chmod 775 /Syslog

COPY ./rsyslog.conf /etc/
COPY ./50-default.conf /etc/rsyslog.d/

WORKDIR /Syslog

EXPOSE 514/udp

ENTRYPOINT ["rsyslogd", "-n"]
