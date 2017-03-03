#!/bin/bash

# Install what we can with apt

# Per https://github.com/docker/docker/issues/6345
# We have to do this for --net=host
#rm /usr/bin/chfn
#ln -s -f /bin/true /usr/bin/chfn

curl -sL https://deb.nodesource.com/setup | sudo bash -

apt-get -q update && apt-get install -qy \
  build-essential \
  git \
  mc \
  nodejs

# Fix avahi-daemon not working without dbus
#sed -i -e "s#\#enable-dbus=yes#enable-dbus=false#g" /etc/avahi/avahi-daemon.conf
#sed -i -e "s/^rlimit-nproc/#rlimit-nproc/g" /etc/avahi/avahi-daemon.conf

npm install -g babel@5

cd /var/tmp/
git clone https://github.com/jishi/node-sonos-http-api
cd node-sonos-http-api

npm install -g --unsafe-perm

if [ ! -f /usr/lib/node_modules/sonos-http-api/settings/settings.json]; then
	echo "================================================"
	echo " Creating settings.json file "
	echo "================================================"
	
		mkdir -p /usr/lib/node_modules/sonos-http-api/settings
		cp /build/settings.json /app/settings/settings.json
		cp /app/settings/settings.json /usr/lib/node_modules/sonos-http-api/settings/settings.json
		
	echo " Done"
	echo "================================================" 
fi

echo " "

if [ ! -f /usr/lib/node_modules/sonos-http-api/presets/presets.json]; then
	echo "================================================"
	echo " Creating presets.json file "
	echo "================================================"
	
		mkdir -p /usr/lib/node_modules/sonos-http-api/presets
		cp /build/presets.json /app/presets/presets.json
		cp /app/presets/presets.json /usr/lib/node_modules/sonos-http-api/presets/presets.json
	
	echo " Done"
	echo "================================================" 
fi


cd /usr/lib/node_modules/sonos-http-api