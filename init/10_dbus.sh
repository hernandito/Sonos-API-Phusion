#!/bin/bash

if [ -e /var/run/dbus/pid ]; then rm -f /var/run/dbus/pid; fi
mkdir -p /var/run/dbus
#chown messagebus:messagebus /var/run/dbus
#dbus-uuidgen --ensure
sleep 1

#sh /build/prepare.sh this is now in instal.sh
sh /build/install.sh

cp /app/presets/presets.json /usr/lib/node_modules/sonos-http-api/presets/presets.json
cp /app/settings/settings.json /usr/lib/node_modules/sonos-http-api/settings/settings.json

cd /usr/lib/node_modules/sonos-http-api
npm start
