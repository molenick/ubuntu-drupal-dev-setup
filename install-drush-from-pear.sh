#!/bin/bash
apt-get install php-pear
pear channel-discover pear.drush.org
pear install drush/drush
