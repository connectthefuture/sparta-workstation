#/bin/bash

echo "------------------- Running as user: $(whoami) -------------------"

# Fix bootloader issue
# (http://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt)
export 'GRUB_RECORDFAIL_TIMEOUT=0' > /etc/default/grub
export DEBIAN_FRONTEND=noninteractive

# unset UCF_FORCE_CONFFOLD
# export UCF_FORCE_CONFFNEW=YES
# ucf --purge /boot/grub/menu.lst

apt-get -y update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

# Upgrade system and install dependancies
apt-get install -y language-pack-en build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ssl-cert subversion language-pack-en debconf-utils python-pip

# Install Redis (http://vvv.tobiassjosten.net/linux/installing-redis-on-ubuntu-with-apt/)
echo "# /etc/apt/sources.list.d/dotdeb.org.list" > /etc/apt/sources.list.d/dotdeb.org.list
echo "deb http://packages.dotdeb.org squeeze all" >> /etc/apt/sources.list.d/dotdeb.org.list
echo "deb-src http://packages.dotdeb.org squeeze all" >> /etc/apt/sources.list.d/dotdeb.org.list
wget -q -O - http://www.dotdeb.org/dotdeb.gpg | apt-key add -
apt-get update
apt-get install -y redis-server

# Install MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
chown -R root /etc/apt
apt-get update

# Install MySQL Server
export DEBIAN_FRONTEND=noninteractive
apt-get -q -y install mysql-server

# Install Extra Development tools
apt-get install -y node vim curl

# Upgrade pip
echo "Upgrading Pip with $(which pip)"
pip install --upgrade pip setuptools

# Install HTTPie
/usr/local/bin/pip install --upgrade httpie
