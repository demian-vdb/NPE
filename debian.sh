#!/bin/bash

apt update -y

apt install docker.io -y

docker pull grafana/grafana:8.3.0
docker run -d --name=grafana --restart=unless-stopped -p 3000:3000 grafana/grafana:8.3.0

sh -c 'echo "" >> /etc/network/interfaces'
sh -c 'echo "auto enp0s8" >> /etc/network/interfaces'
sh -c 'echo "iface enp0s8 inet static" >> /etc/network/interfaces'
sh -c 'echo "    address 192.168.0.20" >> /etc/network/interfaces'
sh -c 'echo "    netmask 255.255.255.0" >> /etc/network/interfaces'

shutdown now -r