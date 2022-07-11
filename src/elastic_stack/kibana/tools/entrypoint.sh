#cd /home/elasticsearch/kibana-8.3.1
curl -v --cacert /etc/kibana/config/certs/ca/ca.crt https://master-node:9200 
curl -s -X POST --cacert /etc/kibana/config/certs/ca/ca.crt -u elastic:$ELASTIC_PASSWORD -H "Content-Type: application/json" https://master-node:9200/_security/user/kibana_system/_password -d "{\"password\":\"$KIBANA_PASSWORD\"}";


systemctl enable kibana.service
systemctl start kibana.service
tail -f /dev/null
