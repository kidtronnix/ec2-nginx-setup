# EC2 instance with nginx / laravel / bootstrap

Set up an ec2 instance running a basic laravel 4 site using nginx. The Laravel 4 application uses Bootstrap 3.0 and can be found at http://github.com/BenBradley/Laravel-4-Bootstrap
## How to install

### Launch an EC2 instance using the amazon web console

Set up an m1.small instance running Ubuntu Server 12.04.2. Assign the server to a security group with the standard HTTP port (80), HTTPS port (443) and SSH port (22). See documentation if you do not know how to do this: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html

Once the instance is running, allocate a new elastic ip address to your account and assign it to the new instance. 

Note that you cannot use a t1.micro instance as it does not have enough ram to use composer which is required for Laravel dependency management. 

Remotely connect to the instance using your tool of choice.

-----

### Install git using apt-get

    sudo apt-get install -y git-core

-----

### Clone this directory onto the server and do some file management

    sudo git clone https://github.com/BenBradley/ec2-nginx-setup
    sudo mv ec2-nginx-setup/* .
    sudo rm -rf ec2-nginx-setup/ README.md

-----

###  Modify the setup files to use your own site name. Replace put-your-site-name-here with your site name (Do not include top level domain).

    sed -ie s/sitename/put-your-site-name-here/g setup.sh
    sed -ie s/sitename/put-your-site-name-here/g laravel.conf

-----

### Modify the setup files to use your server name. Replace put-your-server-name-here with your server name.

    sed -ie s/hostnameholder/put-your-server-name-here/g setup.sh

-----

### Modify the setup files to use your servers ip address. Replace put-your-ip-address-here with your servers ip address. Do some file clean up.

    sed -ie s/ipaddress/put-your-ip-address-here/g setup.sh
    sudo rm setup.she
    sudo rm laravel.confe

-----

### Update the setup.sh permissons and then run the shell script

    sudo chmod 777 setup.sh
    ./setup.sh

This will take a while and will install the following onto the server:

nginx

php5-fpm

php5-cli

php5-mcrypt

mysql-server

php5-mysql

emacs

composer

laravel 4 template site: http://github.com/BenBradley/Laravel-4-Bootstrap

laravel 4 template site dependencies (using composer)

The shell script will set up the nginx server and a configuration file for your site. Whilst the script is running you will be prompted to enter a mysql password for the root user and then enter this password twice more when running mysql_secure_installation and also when setting up a new database.

-----

### Update Laravels database configuration file using your text editor of choice

    sudo nano app/config/


### View your new site

Navigate to your servers ip address in your browser and you should see the basic Laravel/Bootstrap template site. Happy coding.

### License

This is open-sourced software license under the [MIT license](http://opensource.org/licenses/MIT)
