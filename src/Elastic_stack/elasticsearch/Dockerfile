from debian:bullseye

RUN mkdir srcs

WORKDIR /srcs

copy ./tools ./tools

RUN chmod +x tools/build.sh  && sh tools/build.sh

WORKDIR /home/elasticsearch
