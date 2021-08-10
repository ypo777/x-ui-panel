FROM ubuntu:21.04

COPY v2ray_setup_docker.sh /v2ray_setup_docker.sh
ENV ENV /v2ray_setup_docker.sh
RUN chmod +x /v2ray_setup_docker.sh
RUN ./v2ray_setup_docker.sh
CMD "/bin/sh"
