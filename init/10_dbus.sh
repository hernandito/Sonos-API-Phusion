#!/bin/bash

if [ -e /var/run/dbus/pid ]; then rm -f /var/run/dbus/pid; fi
mkdir -p /var/run/dbus
#chown messagebus:messagebus /var/run/dbus
#dbus-uuidgen --ensure
sleep 1

sh /build/prepare.sh
sh /build/install.sh

cd /usr/lib/node_modules/sonos-http-api
npm start
