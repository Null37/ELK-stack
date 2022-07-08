cd /home/elasticsearch/kibana-8.3.1

curl -s -X POST --cacert config/certs/ca/ca.crt -u elastic:${ELASTIC_PASSWORD} -H "Content-Type: application/json" https://master-node:9200/_security/user/kibana_system/_password -d "{\"password\":\"${KIBANA_PASSWORD}\"}";

echo "toor" | sudo -S chown root /home/elasticsearch/metricbeat-8.3.1/metricbeat.yml
cd /home/elasticsearch/metricbeat-8.3.1
echo "toor" | sudo -S ./metricbeat -e
cd -

exec bin/kibana
