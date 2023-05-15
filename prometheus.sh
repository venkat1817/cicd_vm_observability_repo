#!/bin/bash
cd /opt
wget https://github.com/prometheus/prometheus/releases/download/v2.39.1/prometheus-2.39.1.linux-amd64.tar.gz
tar -xf prometheus-2.39.1.linux-amd64.tar.gz
cd prometheus-2.39.1.linux-amd64/
nohup ./prometheus &

#sg
===
#prometheus --- 9090 ---- nodeexporter --sg
#prometheus --- 9090 ---- grafana      --sg
# prometheus.yml file open  - job_name: "prometheus"
    # static_configs:
    #  - targets: ["localhost:9090"]
 # - job_name: "node"
 # static_configs:
    #  - targets: ["172.31.95.107:9100"]
 # - job_name: "apache"
   # static_configs:
    #  - targets: ["172.31.95.107:9117"]
