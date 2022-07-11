sudo docker-compose down
sudo rm -rf /var/lib/docker/volumes/elk-stack_certs
sudo docker stop $(sudo docker ps -qa);
sudo docker rm -f $(sudo docker ps -qa);
#sudo docker rmi -f elasticsearch37;
#sudo docker rmi -f kibana;
#sudo docker rmi -f metricbeat;
sudo docker rmi -f logstash;
#sudo docker rmi -f elastic-agent;
sudo docker volume rm $(sudo docker volume ls -q);
sudo docker network rm $(sudo docker network ls -q) 2>/dev/null
sudo docker-compose up
