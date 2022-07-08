#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade

#installing utils

apt-get -y install wget curl unzip

cd /home/elasticsearch

curl --retry 10 -S -L --output /tmp/kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -zxf /tmp/kibana.tar.gz
cd -

rm -rf /tmp/kibana.tar.gz
cp -rf /tmp/kibana* /home/elasticsearch/kibana-8.3.1

cd kibana-8.3.1
rm -rf config/kibana.yml
cp /srcs/configs/kibana.yml ./config

mkdir -p config/certs

#adding user and group
chown -R 1000:1000 /home/elasticsearch


