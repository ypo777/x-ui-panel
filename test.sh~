read -p "Mail : " email
read -p "Domain:" domain
sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email ${email} -d ${domain}
