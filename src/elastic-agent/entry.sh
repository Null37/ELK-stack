cd /root/elastic-agent-8.3.1

 - FLEET_SERVER_ELASTICSEARCH_CA=/root/ca/ca.crt
      - FLEET_SERVER_ENABLE=true
      - FLEET_SERVER_ELASTICSEARCH_HOST=https://master-node:9200
      - F:wq
      LEET_SERVER_ELASTICSEARCH_USERNAME=elastic
      - FLEET_SERVER_ELASTICSEARCH_PASSWORD=${ELASTIC_PASSWORD}
      - KIBANA_FLEET_SETUP=1
      - KIBANA_HOST=http://kibana:5601
      - KIBANA_USERNAME=elastic
      - KIBANA_PASSWORD=${KIBANA_PASSWORD}
      - FLEET_SERVER_ELASTICSEARCH_INSECURE=true
      - FLEET_SERVER_POLICY=fleet-server-policy
./elastic-agent install -f \
   --url=https://elastic-agent:8220 \
   --fleet-server-es=https://master-node:9200 \
   --fleet-server-es-ca=/root/ca/ca.crt \
   --fleet-server-policy=fleet-server-policy
