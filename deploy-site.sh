#!/bin/bash

if [[ $# -lt 2 || $1 == "--help" || $1 == "-h" ]]
then
  echo "Usage:"
  echo "  sudo `basename $0` SITENAME FOLDERNAME"
  echo "Examples:"
  echo "  sudo `basename $0` drupal-8 drupal"
  exit
fi

#You'll probably want to change this to your actual directory. :)
WORKDIR="/var/workspace"
APACHEDIR="/etc/apache2/sites-available"
HOSTSFILE="/etc/hosts"

echo "<VirtualHost *:80>
	ServerAlias $1.localhost
	DocumentRoot $WORKDIR/$2
	<Directory \"$WORKDIR/$2\">
		Options FollowSymLinks
		AllowOverride All
		Require all granted
        </Directory>
</VirtualHost>" > $APACHEDIR/$1.conf
a2ensite $1
service apache2 restart
grep -q "127.0.0.1  $1.localhost" $HOSTSFILE
if [ $? -ne 0 ]; then
  echo "127.0.0.1  $1.localhost" >> $HOSTSFILE
fi
