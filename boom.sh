#!/bin/sh
echo "Enter the sitename: (dont include .com)"
read sitenamev
echo "Enter the public ip:"
read ip
echo "Starter Repo:"
read repo
echo ""

# Clone this directory onto the server and do some file management
sudo mv ec2-nginx-setup/* .
sudo rm -rf ec2-nginx-setup/ README.md

# Modify the setup files to use your own site name. Replace put-your-site-name-here with your site name (Do not include top level domain).
sed -ie "s/sitename/$sitenamev/g" setup.sh
sed -ie "s/sitename/$sitenamev/g" codeigniter.conf

# Modify the setup files to use your server name. Replace put-your-server-name-here with your server name.
sed -ie "s/hostnameholder/$(hostname)/g" setup.sh

# Modify the setup files to use your servers ip address.
# Replace put-your-ip-address-here with your servers ip address.
sed -ie "s/ipaddress/$ip/g" setup.sh

# Modify setup file to use prompted git repo
sed -i "s|githolder|${repo}|" setup.sh

# Do some file clean up.
sudo rm setup.she
sudo rm codeigniter.confe

# Update the setup.sh permissons and then run the shell script
sudo chmod 777 setup.sh
./setup.sh