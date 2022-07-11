from debian:bullseye

ARG ELASTIC_USER_HASH
ENV ELASTIC_USER_HASH=$6$1H4y54gyPJaV4/wz$UY0p3up84tHoKrX8i7ID.3RTM.W.yiVzGYlPEYUwUrAtz.D5IyZCrSvU2I1K87Ys4qwXFoTeV73TtxLTS9nUF0

RUN echo $ELASTIC_USER_HASH

RUN groupadd -g 1000 elasticsearch
RUN useradd --uid 1000 --gid 1000 -m -p $ELASTIC_USER_HASH elasticsearch
RUN usermod -a -G sudo elasticsearch

RUN mkdir srcs

WORKDIR /srcs

COPY ./configs ./configs
COPY ./tools ./tools

RUN chmod +x tools/build.sh  && bash tools/build.sh

WORKDIR /home/elasticsearch

USER elasticsearch

WORKDIR /home/elasticsearch/elasticsearch-8.3.1

ENTRYPOINT ["/bin/bash", "/srcs/tools/entrypoint.sh"]
