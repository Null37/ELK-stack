FROM debian:bullseye
COPY . /root/.

USER root
WORKDIR /root

RUN /bin/bash build.sh

ENTRYPOINT ["/bin/bash", "/root/entry.sh"]

