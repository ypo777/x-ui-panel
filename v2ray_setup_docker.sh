#!/bin/bash
#Server Configure 

echo "Updating apt "
apt-get update -y
echo "Update Finished"
apt-get upgrade -y
echo "Upgrade finished"

echo "Installing Requirements"
#Requirement Installation 
apt install software-properties-common -y 
add-apt-repository ppa:certbot/certbot -y 
apt install curl -y 
apt-get install certbot -y 
echo "Start Install v2ray"
#Install v2ray UI script 
apt install curl -y
bash <(curl -Ls https://raw.githubusercontent.com/ypo777/Shell_Scripts/main/v2-ui.sh)

