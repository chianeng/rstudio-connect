#!/bin/bash
#updates  the  package
sudo apt-get update

# download and install all nginx dependencies
sudo apt-get install nginx

#enable and start nginx
sudo systemctl enable nginx.service

#download rstudio connect and install it
sudo apt-get install gdebi-core
wget https://cdn.rstudio.com/connect/rstudio-connect_amd64.deb
sudo systemctl status rstudio-connect