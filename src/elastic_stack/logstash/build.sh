#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade


#installing utils
apt-get -y install coreutils wget curl unzip vim sudo 
mkdir -p /root/config/certs


curl --retry 10 -S -L --output /tmp/logstash.tar.gz https://artifacts.elastic.co/downloads/logstash/logstash-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -zxf /tmp/logstash.tar.gz
#cd -

rm -rf /tmp/logstash.tar.gz
cp -rf /tmp/logstash* /root/logstash-8.3.1
cd /root/logstash-8.3.1
rm -rf config/logstash.yml
rm -rf config/pipelines.yml
unzip /root/archive.zip
cp Games.csv config/.


#cd /root/logstash-8.3.1
#rm -rf logstash.yml
#cp /root/logstash.yml /root/logstash-8.3.1/.
