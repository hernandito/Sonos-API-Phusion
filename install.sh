#!/bin/bash

if [ ! -f /build/donoterase.txt]; then
	echo "================================================"
	echo " Installing for First Time  "
	echo "================================================"
	echo " Preparing  "
	echo "================================================"
		sh /build/prepare.sh
	
		mkdir -p /app/settings
		mkdir -p /app/presets

		apt-get -q update

		apt-get install -qy \
		  build-essential \
		  git \
		  mc \
		  python-software-properties \
		  screen

		curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
		apt-get install -y nodejs

		npm install -g n
		n stable
		npm install npm@latest -g
		node -v
		npm -v


		# Fix avahi-daemon not working without dbus
		#sed -i -e "s#\#enable-dbus=yes#enable-dbus=false#g" /etc/avahi/avahi-daemon.conf
		#sed -i -e "s/^rlimit-nproc/#rlimit-nproc/g" /etc/avahi/avahi-daemon.conf

		npm install -g babel@5

		cd /var/tmp/
		git clone https://github.com/jishi/node-sonos-http-api
		cd node-sonos-http-api

		npm install -g --unsafe-perm

	echo "================================================" 
	echo " Creating settings.json file "
	echo "================================================" 
	
		mkdir -p /usr/lib/node_modules/sonos-http-api/settings
		cp /build/settings.json /usr/lib/node_modules/sonos-http-api/settings/settings.json
		cp /build/settings.json /app/settings/settings.json
		
		ls -l /usr/lib/node_modules/sonos-http-api/settings/
		
	echo " "		
	echo "================================================" 
	echo " Creating presets.json file "
	echo "================================================" 	
		
		mkdir -p /usr/lib/node_modules/sonos-http-api/presets
		cp /build/presets.json /usr/lib/node_modules/sonos-http-api/presets/presets.json		
		cp /build/presets.json /app/presets/presets.json
		
		ls -l /usr/lib/node_modules/sonos-http-api/presets/
		
	echo " Done"
	echo "================================================" 
	echo " Cleaning up...."
	echo "================================================" 	
		sh /build/cleanup.sh	
	echo "================================================" 
	echo " Installation Succesfully Completed! Yay!"
	echo "================================================" 
	
	cp /build/presets.json /build/donoterase.txt
fi


#cd /usr/lib/node_modules/sonos-http-api

