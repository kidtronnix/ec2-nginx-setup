
sudo apt-get install -y git-core

sudo git clone https://github.com/BenBradley/ec2-nginx-setup


sudo mv ec2-nginx-setup/ec2/* .

sudo rm -rf ec2-nginx-setup/

sed -ie s/sitename/QuoteGoat/g setup.sh

sed -ie s/sitename/QuoteGoat/g laravel.conf

sed -ie s/hostnameholder/Hydrogen/g setup.sh

sed -ie s/ipaddress/54.229.121.178/g setup.sh



sudo rm setup.she

sudo rm laravel.confe



sudo chmod 777 setup.sh

./setup.sh
