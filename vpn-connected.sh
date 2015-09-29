#!/bin/bash

# Dependecies
# test
# dig
# OpenDNS servers

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

COLOR="F2777A"

if test -e /proc/sys/net/ipv4/conf/tun0; then
	COLOR="99CC99"
fi

echo "<span color=\"#$COLOR\">$IP</span>"
