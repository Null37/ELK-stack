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



#cd /home/elasticsearch

#curl --retry 10 -S -L --output /tmp/kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-8.3.1-linux-x86_64.tar.gz

#cd /tmp
#tar -zxf /tmp/kibana.tar.gz
#cd -

#rm -rf /tmp/kibana.tar.gz
#cp -rf /tmp/kibana* /home/elasticsearch/kibana-8.3.1

cd /etc/kibana/
rm -rf /etc/kibana/kibana.yml
cp /srcs/configs/kibana.yml .

mkdir -p config/certs



#adding user and group
#chown -R 1000:1000 /home/elasticsearch



