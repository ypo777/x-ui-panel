FROM ubuntu:21.04

CMD ["bash"]
ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive
RUN  /bin/sh -c apt-get update \
    && apt-get install -y systemd systemd-sysv     \
    && apt-get clean     \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /bin/sh -c rm -f /lib/systemd/system/multi-user.target.wants/*     /etc/systemd/system/*.wants/*     /lib/systemd/system/local-fs.target.wants/*     /lib/systemd/system/sockets.target.wants/*udev*     /lib/systemd/system/sockets.target.wants/*initctl*     /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup*     /lib/systemd/system/systemd-update-utmp*
VOLUME [/sys/fs/cgroup]
CMD  ["/lib/systemd/systemd"]
ENV SHELL=/bin/bash
RUN /bin/sh -c apt-get update     \
    && apt-get install -y wget procps     \
    && wget https://raw.githubusercontent.com/ypo777/v2-ui/master/install.sh --no-check-certificate     \
    && bash ./install.sh     \
    && rm ./install.sh     \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
VOLUME [/etc/v2-ui]
EXPOSE map[65432/tcp:{}]
