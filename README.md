# Scripts for Installation v2ray VPN 
> Docker Based on https://github.com/thesadboy/x-ui-docker

> V2ray Setup Based on https://privacymelon.com/how-to-setup-v2ray-ws-tls-cdn/


## Requirements
- Domain Name
- VPS
- [CloudFlare Account For DNS Service](https://dash.cloudflare.com/sign-up)

### Table of Contents
+ [Ubuntu Machines](#ubuntu)
+ [Docker Image](#docker)
+ [Getting SSL](#ssl)
+ [Admin Panel Configuration](#admin)
+ [Client Devices](#client)

<a name="ubuntu"/>

##### Get Started for Ubuntu Machine
- Point Your NameServers to CloudFlare
- Point Your VPS IP to Your Domain Name
- Clone repo to your machine
```
git clone https://github.com/ypo777/Shell_Scripts.git
```
- Give permission to script you want to run
```
chmod u+x v2ray_setup.sh
./v2ray_setup.sh
```
<a name="docker"/>

##### Get Started for Docker Image
- Pull docker image
```
docker pull ypo007/x-ui
```
- Create a container
```
docker run --restart=always --name x-ui -d -p 54321:54321 -p 8000-8010:8000-8010/tcp -p 8000-8010:8000-8010/udp --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/x-ui:/etc/x-ui ypo007/x-ui
```

<a name="ssl"/>

##### Getting SSL Certificate
```
sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email your-email-address -d test.example.com
```
- Copy Paths of Certificate file and Key file

<a name="admin" />

##### Configuration
- Default Port for v2-ui panel : **http://YOURIP:54321**
- Admin User & Password: both "admin"

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
- Instruction for Admin Panel and new user setup
- Instruction for Client Side Setup


