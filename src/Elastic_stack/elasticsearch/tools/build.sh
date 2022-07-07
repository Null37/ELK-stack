#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade

#installing utils

apt-get -y install wget curl


# install elasticserach

curl --retry 10 -S -L --output /tmp/elasticsearch.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -zxf /tmp/elasticsearch.tar.gz
cd -
#adding user and group
groupadd -g 1000 elasticsearch && \
useradd --uid 1000 --gid 1000 -m -p testing elasticsearch

#copying elasticsearch
mkdir /home/elasticsearch/elasticsearch-8.3.1
cp -rf /tmp/elasticsearch-8.3.1 /home/elasticsearch
chown -R 1000:1000 /home/elasticsearch
