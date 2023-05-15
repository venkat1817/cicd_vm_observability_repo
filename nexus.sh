#!/bin/bash
sudo yum install wget -y
yum install java-1.8.0 -y
cd /opt
sudo wget -O nexus3.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar -xvf nexus3.tar.gz
sudo mv nexus-3* nexus
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo sed -i 's/#run_as_user=""/run_as_user="nexus"/g' /opt/nexus/bin/nexus.rc
sudo sed -i 's/-Xms2703m/-Xms512m/g' /opt/nexus/bin/nexus.vmoptions
sudo sed -i 's/-Xmx2703m/-Xmx512m/g' /opt/nexus/bin/nexus.vmoptions
sudo sed -i 's/-XX:MaxDirectMemorySize=2703m/-XX:MaxDirectMemorySize=512m/g' /opt/nexus/bin/nexus.vmoptions

cat <<EOT>> /etc/systemd/system/nexus.service
[Unit]
Description=nexus service
After=network.target
[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target
EOT
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig --levels 345 nexus on
sudo service nexus start