FROM micko920/homelab-10-systemd:proxy

ENV container=docker

#### Environment Options ####
#

RUN systemctl enable caddy

VOLUME ["/sys/fs/cgroup", "/var/log/caddy"]

CMD ["/sbin/init"]
