#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade

#installing utils

apt-get -y install wget curl unzip

#adding user and group

#groupadd -g 1000 elasticsearch && \
#useradd --uid 1000 --gid 1000 -m elasticsearch

# install elasticserach

curl --retry 10 -S -L --output /tmp/elasticsearch.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -zxf /tmp/elasticsearch.tar.gz
cd -

#copying elasticsearch
cp -rf /tmp/elasticsearch-8.3.1 /home/elasticsearch

cd /home/elasticsearch/elasticsearch-8.3.1

mkdir -p config/certs
mkdir -p config/certs/ca
mkdir -p /home/elasticsearch/elasticsearch-8.3.1/data
mkdir -p /home/elasticsearch/elasticsearch-8.3.1/logs

rm -rf config/elasticsearch.yml
cp /srcs/configs/elasticsearch.yml ./config

#installing metricbeat

cd /home/elasticsearch
curl --retry 10 -S -L --output /tmp/metricbeat.tar.gz https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -xzf /tmp/metricbeat.tar.gz
cd -

cp -rf /tmp/metricbeat-8.3.1-linux-x86_64 /home/elasticsearch
mv /home/elasticsearch/metricbeat-8.3.1-linux-x86_64 /home/elasticsearch/metricbeat-8.3.1
chown -R 1000:1000 /home/elasticsearch



