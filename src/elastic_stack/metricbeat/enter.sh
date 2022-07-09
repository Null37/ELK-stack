curl --retry 10 -S -L --output /tmp/metricbeat.tar.gz https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-8.3.1-linux-x86_64.tar.gz

cd /tmp
tar -zxf /tmp/metricbeat.tar.gz
#cd -

rm -rf /tmp/metricbeat.tar.gz
cp -rf /tmp/metricbeat* /root/metricbeat-8.3.1

cd /root/metricbeat-8.3.1
rm -rf metricbeat.yml
cp /root/metricbeat.yml /root/metricbeat-8.3.1/.
./metricbeat setup -e
./metricbeat -e

