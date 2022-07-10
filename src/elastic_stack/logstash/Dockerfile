FROM debian:bullseye
COPY . /root/.

USER root
WORKDIR /root
RUN mkdir -p /root/config/certs
COPY archive.zip .

RUN /bin/bash build.sh

COPY ./logstash.yml /root/logstash-8.3.1/config/.
COPY ./logstash.conf /root/logstash-8.3.1/config/.
COPY ./pipelines.yml /root/logstash-8.3.1/config/.

ENTRYPOINT ["/bin/bash", "/root/entry.sh"]
