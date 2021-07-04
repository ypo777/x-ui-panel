#!/bin/bash
#Progress Bar 
read -p "Enter your mail:" email
read -p "Enter your doman:" domain

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
bash <(curl -Ls https://blog.sprov.xyz/v2-ui.sh)
#Get SSL Certificate 
if [ -v "$email" ]; then 
	echo "Generate Cerbot"
fi	
certbot certonly --standalone --preferred-challenges http --agree-tos --email ${email} -d ${domain}
