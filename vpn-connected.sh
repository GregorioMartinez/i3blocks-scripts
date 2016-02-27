#!/bin/bash

# Dependecies
# test
# wget

IP=$(wget http://ipinfo.io/ip --quiet --output-document=-)

COLOR="F2777A"

if test -e /proc/sys/net/ipv4/conf/tun0; then
	COLOR="99CC99"
fi

echo "<span color=\"#$COLOR\">$IP</span>"
