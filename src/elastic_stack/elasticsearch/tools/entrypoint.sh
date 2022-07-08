cd /home/elasticsearch/elasticsearch-8.3.1

id

if [  ! -f /home/elasticsearch/elasticsearch-8.3.1/config/certs/ca/ca.crt ]
then

	mkdir -p /home/elasticsearch/elasticsearch-8.3.1/config/certs

	bin/elasticsearch-certutil ca --silent --pem -out config/certs/ca.zip
	unzip config/certs/ca.zip -d config/certs

	echo -ne \
          "instances:\n"\
          "  - name: master-node\n"\
          "    dns:\n"\
          "      - master-node\n"\
          "      - localhost\n"\
          "    ip:\n"\
          "      - 127.0.0.1\n"\
          > config/certs/instances.yml;

	bin/elasticsearch-certutil cert --silent --pem -out config/certs/certs.zip --in config/certs/instances.yml --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key
	unzip config/certs/certs.zip -d config/certs

fi



exec bin/elasticsearch

