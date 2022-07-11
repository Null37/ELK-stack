#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade


#installing utils
apt-get -y install coreutils wget curl unzip vim sudo 
mkdir -p /root/


curl --retry 10 -S -L --output /tmp/elastic-agent.tar.gz https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -zxf /tmp/elastic-agent.tar.gz
#cd -

rm -rf /tmp/elastic-agent.tar.gz
cp -rf /tmp/elastic-agent* /root/elastic-agent-8.3.1

cd /root/elastic-agent-8.3.1
rm -rf elastic-agent.yml
cp /root/elastic-agent.yml /root/elastic-agent-8.3.1/.
