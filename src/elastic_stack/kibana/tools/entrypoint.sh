#cd /home/elasticsearch/kibana-8.3.1
curl -v --cacert /etc/kibana/config/certs/ca/ca.crt https://master-node:9200 
curl -s -X POST --cacert /etc/kibana/config/certs/ca/ca.crt -u elastic:testing -H "Content-Type: application/json" https://master-node:9200/_security/user/kibana_system/_password -d "{\"password\":\"testing\"}";

#curl --retry 10 -S -L --output /tmp/metricbeat.tar.gz https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.3.1-linux-x86_64.tar.gz

#cd /tmp
#tar -zxf /tmp/metricbeat.tar.gz
#cd -

#rm -rf /tmp/metricbeat.tar.gz
#cp -rf /tmp/metricbeat* /home/elasticsearch/metricbeat-8.3.1

#cd /home/elasticsearch/metricbeat-8.3.1
#rm -rf metricbeat.yml
#cp /srcs/configs/metricbeat.yml .


systemctl enable kibana.service
systemctl start kibana.service
tail -f /dev/null
#x=0
#while [ $x -le 30 ]
#do
#if curl -s --cacert /etc/kibana/config/certs/ca/ca.crt https://master-node:9200 | grep -q 'missing authentication credentials'
        #then
#                ./metricbeat modules disable kibana
#		./metricbeat modules disable system
#		./metricbeat modules enable kibana-xpack
#		rm -rf modules.d/kibana-xpack.yml
#		cp /srcs/configs/kibana-xpack.yml ./modules.d/.
#		./metricbeat setup -e
#		./metricbeat -e
         #       break
        #fi
        #echo "still waiting"
        #sleep 10
        #x=$(( $x + 1 ))
#done


