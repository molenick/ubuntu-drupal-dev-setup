#!/bin/bash
# Installs my fork of backdrop's fork of drush.
mkdir ~/.drush/commands
cd ~/.drush/commands
wget https://github.com/molenick/drush/archive/master.zip
unzip master.zip -d backdrop
rm master.zip
