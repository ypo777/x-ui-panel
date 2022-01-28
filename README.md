# Scripts for Installation v2ray VPN 
> Docker Based on https://github.com/thesadboy/x-ui-docker

> V2ray Setup Based on https://privacymelon.com/how-to-setup-v2ray-ws-tls-cdn/


## Requirements
- Domain Name
- VPS
- [CloudFlare Account For DNS Service](https://dash.cloudflare.com/sign-up)

### Table of Contents
1. [Getting Started](#1-getting-started)
2. [Ubuntu](#ubuntu)
3. [Docker Image](#docker)
5. [Getting SSL](#ssl)
6. [Admin Panel Configuration](#admin)
7. [Client Devices](#client)

<a name="getstart"/>

### 1. Getting Started
- Point Your NameServers to CloudFlare
- Point Your VPS IP to Your Domain Name

<a name="ubuntu"/>

### 2. Ubuntu
Using Bash Script: 
```
bash <(curl -s https://raw.githubusercontent.com/ypo777/x-ui-panel/main/Bash/v2ray_setup.sh )
```

Using Ansible:
 - add your IP Address, Username And SSH Keys in Inventory
 ```
 ansible-playbook v2raysetup.yaml
 ``` 
<a name="docker"/>

### 3. Docker Image
- Pull docker image
```
docker pull ypo007/x-ui
```
- Create a container
```
docker run --restart=always --name x-ui -d -p 54321:54321 -p 8000-8010:8000-8010/tcp -p 8000-8010:8000-8010/udp --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/x-ui:/etc/x-ui ypo007/x-ui
```

<a name="ssl"/>

### 4. Getting SSL Certificate
```
sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email your-email-address -d test.example.com
```
- Copy Paths of Certificate file and Key file

<a name="admin" />

### Configuration
- Default Port for v2-ui panel : **http://YOURIP:54321**
- Admin User & Password: both "admin"
- Add a new user: 
    - Go to Inbound List
    - Click ``` + ``` button
    - Enter your desired name in ```remark```
    - Select  ```protocol: vmess```
    - Listen IP ```yourIP```
    - Port : ```your desired port```
    - Transmission: ```ws``` 
    - Open TLS Option
    - Enter your domain name
    - Add Certificated you got from [SSL Certificate](#4-getting-ssl-certificate)
    - If you don't need , close ```sniffing``` option
<a name="client"/>

##### Installing v2ray to Client Devices

###### Android
- [v2RayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang&hl=en&gl=US)
- [NapsternetV](https://play.google.com/store/apps/details?id=com.napsternetlabs.napsternetv&hl=en&gl=US)

###### iOS
- [ShadowRocket](https://apps.apple.com/us/app/shadowrocket/id932747118)
- [FairVPN](https://apps.apple.com/us/app/fair-vpn/id1533873488)

###### Windows & MacOS
- [Qv2ray](https://qv2ray.net/)


###### TODO
- Add Timezone Selection 

