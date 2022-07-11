from debian:bullseye

RUN mkdir srcs

WORKDIR /srcs

COPY ./configs ./configs
COPY ./tools ./tools

RUN chmod +x tools/build.sh  && bash tools/build.sh

WORKDIR /home/elasticsearch

ENTRYPOINT ["/bin/bash", "/srcs/tools/entrypoint.sh"]
