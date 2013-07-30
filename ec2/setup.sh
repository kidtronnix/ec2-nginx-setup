# Change the host name, replace ip and host name with correct information
sudo chmod 777 /etc/hosts
sudo echo "ipaddress Hydrogen" >> /etc/hosts
sudo chmod 644 /etc/hosts

sudo chmod 777 /etc/hostname
sudo echo "Hydrogen" > /etc/hostname
sudo chmod 644 /etc/hostname
sudo hostname -F /etc/hostname

# Update and upgrade packages using apt-get
sudo apt-get update
sudo apt-get upgrade --show-upgraded

# Install git and curl 
sudo apt-get install -y git-core
sudo apt-get install -y git
sudo apt-get install -y curl

# Install nginx and php
sudo apt-get install nginx php5-fpm

# Move the laravel.conf file to the nginx sites-enabled directory 
sudo mv ~/laravel.conf /etc/nginx/sites-enabled/sitename.com

# Install mysql
sudo apt-get install mysql-server php5-mysql
sudo mysql_secure_installation

# Make the main site directory and logs subdirectory
sudo git clone git://github.com/BenBradley/Laravel-4-Bootstrap.git sitename
sudo mkdir sitename/logs

# Symbollically link the site directory to enable the site and then restart the server
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled
sudo /etc/init.d/nginx restart

# Install emacs
sudo add-apt-repository ppa:cassou/emacs
sudo apt-get update
sudo apt-get install emacs-snapshot
emacs-snapshot

# Install composer and then use composer to install all dependencies
sudo curl -s http://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

cd sitename
composer install --dev

# Set up database
sudo mysqladmin -u root -p create sitename

# Change permissions on the app/storage directory
sudo chmod -R 777 app/storage

# Set encryption key
sudo php artisan key:generate

# Build assets using bassett
sudo php artisan basset:build
