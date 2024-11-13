#!/bin/sh

PW=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 20; echo)

echo "user:${PW}" | chpasswd
echo -e "\n\n\nThe password for 'user' is '${PW}'\n\n\n"
