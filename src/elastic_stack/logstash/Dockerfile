FROM debian:bullseye
COPY ./tools/ /root/.

USER root

WORKDIR /root

RUN mkdir -p /root/config/certs

RUN /bin/bash build.sh

COPY ./configs/logstash.yml /root/logstash-8.3.1/config/.
COPY ./configs/logstash.conf /root/logstash-8.3.1/config/.
COPY ./configs/pipelines.yml /root/logstash-8.3.1/config/.

ENTRYPOINT ["/bin/bash", "/root/entry.sh"]
