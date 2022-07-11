#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade


#installing utils
apt-get -y install coreutils wget curl unzip vim sudo
apt-get -y install gnupg
apt-get -y install systemctl

#install kibana
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
apt-get -y install apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
apt-get -y update && apt-get -y install kibana=8.3.1



cd /etc/kibana/
rm -rf /etc/kibana/kibana.yml
cp /srcs/configs/kibana.yml .

mkdir -p config/certs
