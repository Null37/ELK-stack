cd /home/elasticsearch/elasticsearch-8.3.1


if [  ! -f /home/elasticsearch/elasticsearch-8.3.1/config/certs/ca/ca.crt ]
then
	if [[ -f bin/elasticsearch-users ]]; then
 		if [[ -n "$ELASTIC_PASSWORD" ]]; then
    			[[ -f config/elasticsearch.keystore ]] || (bin/elasticsearch-keystore create)
    			if ! (bin/elasticsearch-keystore has-passwd --silent) ; then
      				if ! (bin/elasticsearch-keystore list | grep -q '^bootstrap.password$'); then
        				(echo "$ELASTIC_PASSWORD" | bin/elasticsearch-keystore add -x 'bootstrap.password')
      					echo "elastic PASSWORD set to : |$ELASTIC_PASSWORD|"
      				fi
    			fi
  		fi
	fi
	mkdir -p /home/elasticsearch/elasticsearch-8.3.1/config/certs

	bin/elasticsearch-certutil ca --silent --pem -out ca.zip
	unzip ca.zip
	mkdir -p config/certs/ca
	cp -rf ca/* config/certs/ca
	echo -ne \
          "instances:\n"\
          "  - name: master-node\n"\
          "    dns:\n"\
          "      - master-node\n"\
          "      - localhost\n"\
          "    ip:\n"\
          "      - 127.0.0.1\n"\
          > config/certs/instances.yml;

	bin/elasticsearch-certutil cert --silent --pem -out certs.zip --in config/certs/instances.yml --ca-cert config/certs/ca/ca.crt --ca-key config/certs/ca/ca.key
	unzip certs.zip -d tmpcerts	
	cp -rf tmpcerts/* config/certs
fi

exec bin/elasticsearch

#setup metricbeat
#cd /home/elasticsearch/metricbeat-8.3.1

Ex=0
#while [ $x -le 30 ]
#do
#if curl -s --cacert /home/elasticsearch/elasticsearch-8.3.1/config/certs/ca/ca.crt https://master-node:9200 | grep -q 'missing authentication credentials'
 #       then
#		echo "toor" | sudo -S ./metricbeat modules enable elasticsearch-xpack
#		echo "toor" | sudo -S ./metricbeat modules disable system
#		echo "toor" | sudo -S ./metricbeat setup -e
#		echo "toor" | sudo -S rm -rf modules.d/elasticsearch-xpack.yml
#		cp /srcs/configs/elasticsearch-xpack.yml ./modules.d/.
#		echo "toor" | sudo -S ./metricbeat -e
 #               break
  #      fi
   #     echo "still waiting"
   #     sleep 10
    #    x=$(( $x + 1 ))
#done

