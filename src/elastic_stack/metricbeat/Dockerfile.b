FROM docker.elastic.co/beats/metricbeat:8.3.1

COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER root
run mkdir /root/config
run mkdir /root/config/certs
RUN chown root /usr/share/metricbeat/metricbeat.yml
