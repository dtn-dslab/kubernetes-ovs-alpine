FROM alpine:latest

# Install basic tools
RUN apk add --no-cache iproute2 sudo bash

# Install Open vSwitch and Supervisor
RUN apk add --no-cache openvswitch supervisor

RUN mkdir -p /var/run/openvswitch

RUN ovsdb-tool create /etc/openvswitch/conf.db /usr/share/openvswitch/vswitch.ovsschema

ADD supervisord.conf /etc/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]