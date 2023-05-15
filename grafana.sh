# #!/bin/bash
# cd /opt
# wget https://dl.grafana.com/oss/release/grafana-9.2.1.linux-amd64.tar.gz
# tar -xvzf grafana-9.2.1.linux-amd64.tar.gz
# chmod -R 755 grafana-9.2.1
# cd grafana-9.2.1/bin/
# nohup ./grafana-server & 

 #!/bin/bash
cd /tmp
wget https://dl.grafana.com/oss/release/grafana-9.2.1.linux-amd64.tar.gz
tar -xvzf grafana-9.2.1.linux-amd64.tar.gz
mv grafana-9.2.1 grafana
chmod -R 755 grafana
cp -r * /opt
cd /opt
cd grafana
cd bin
nohup ./grafana-server &