#!/bin/bash
sudo su -
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update
sudo apt-get install filebeat
sudo sed -i 's/  enabled: false/  enabled: true/g' /etc/filebeat/filebeat.yml
sudo systemctl enable filebeat.service
# sudo systemctl restart filebeat.service
#Tomcat installation
sudo apt install openjdk-11-jdk -y
cd /opt
wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz
sudo tar xzvf apache-tomcat-10.0.8.tar.gz
cd apache-tomcat-10.0.8 
cd bin
sh startup.sh
sudo sed -i 's%/var/log/\*.log%/opt/apache-tomcat-10.0.8/logs/\*log*%' /etc/filebeat/filebeat.yml
# sudo sed -i 's%"localhost:9200"%"aws_instance.ek.privateip:9200"%' /etc/filebeat/filebeat.yml
sudo sed -i 's/localhost:9200/<elasticsearch_private_ip:9200/g' /etc/filebeat/filebeat.yml