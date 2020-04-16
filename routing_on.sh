#! /bin/sh

#Remember to enable IP forwarding
/sbin/sysctl -w net.ipv4.ip_forward=1

#clean iptables
/sbin/iptables -F
/sbin/iptables -X
/sbin/iptables -t nat -F
/sbin/iptables -t nat -X
/sbin/iptables -t mangle -F
/sbin/iptables -t mangle -X
/sbin/iptables -P INPUT ACCEPT
/sbin/iptables -P FORWARD ACCEPT
/sbin/iptables -P OUTPUT ACCEPT

#setup routing enp0s3 -> enp0s8
/sbin/iptables -A FORWARD -o enp0s8 -i enp0s3 -s 192.168.10.1/24 -m conntrack --ctstate NEW -j ACCEPT
/sbin/iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A POSTROUTING -t nat -j MASQUERADE

