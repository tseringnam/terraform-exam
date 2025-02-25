#!/bin/bash
sudo yum update -y
sudo yum install  httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd 
sudo mkdir /var/www/html/web
sudo echo "</h1> your are at $(hostname -f) </h1>" > /var/www/html/web/index.html