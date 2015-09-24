#!/bin/bash

# Dependecies
# test
# dig
# OpenDNS servers

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

VPN=`test -e /proc/sys/net/ipv4/conf/tun0 && echo $IP || echo "VPN Not Connected"`

echo $VPN
