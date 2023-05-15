#!/bin/bash
cd /opt
wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz
sudo tar xzvf apache-tomcat-10.0.8.tar.gz
cd apache-tomcat-10.0.8 
cd bin
sh startup.sh