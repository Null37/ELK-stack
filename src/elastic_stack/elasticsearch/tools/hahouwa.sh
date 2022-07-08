#!/bin/bash

x=0
while [ $x -le 30 ]
do
if curl -s --cacert /home/elasticsearch/elasticsearch-8.3.1/config/certs/ca/ca.crt https://master-node:9200 | grep -q 'missing authentication credentials'
	then
		echo "toor" | sudo -S ./metricbeat -e
		break
	fi
	echo "still waiting"
 	sleep 10
 	x=$(( $x + 1 ))
done
