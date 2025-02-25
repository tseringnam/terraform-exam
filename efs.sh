#!/bin/bash
sudo yum update -y
sudo yum install  httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd 
sudo mkdir /var/www/html/static
sudo echo "</h1> your are at Static page </h1>" > /var/www/html/static/index.html