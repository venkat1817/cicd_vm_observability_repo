#!/bin/bash
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# amazon-linux-extras install java-openjdk11 -y
yum install java -y 
yum install git -y
yum install jenkins -y
systemctl start jenkins
systemctl enable jenkins
systemctl status jenkins 
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz
tar -xvzf apache-maven-3.9.1-bin.tar.gz
ln -s /opt/apache-maven-3.9.1 maven
ln -s /opt/maven/bin/mvn /usr/bin/mvn 