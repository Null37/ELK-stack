from debian:bullseye

RUN groupadd -g 1000 elasticsearch
RUN useradd --uid 1000 --gid 1000 -m elasticsearch


RUN mkdir srcs

WORKDIR /srcs

COPY ./configs ./configs
COPY ./tools ./tools

RUN chmod +x tools/build.sh  && bash tools/build.sh

WORKDIR /home/elasticsearch

USER elasticsearch

WORKDIR /home/elasticsearch/kibana-8.3.1

ENTRYPOINT ["/bin/bash", "/srcs/tools/entrypoint.sh"]
