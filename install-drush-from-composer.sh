#!/bin/bash
# Installs drush 8
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer global require drush/drush:8.*
composer global update
