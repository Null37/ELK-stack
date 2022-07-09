#!bin/bash

#updating and upgrading packages
apt-get -y update && apt-get -y upgrade


#installing utils
apt-get -y install coreutils wget curl unzip vim sudo 
mkdir -p /root/config/certs

