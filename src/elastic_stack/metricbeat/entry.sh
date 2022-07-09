cd /root/metricbeat-8.3.1

x=0
while [ $x -le 30 ]
do
	curl -s -I http://kibana:5601 | grep '302 Found'
	if [ $? -eq 0 ];
	then
		./metricbeat setup -e
		./metricbeat -e
        	break
        fi
        echo "Still waiting for kibana to start"
        sleep 10
        x=$(( $x + 1 ))
done


