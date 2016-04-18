#/bin/bash

echo "------------------- Running as user: $(whoami) -------------------"
# Upgrade system and install dependancies
apt-get update
apt-get -y upgrade
apt-get install -y language-pack-en build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ssl-cert subversion language-pack-en debconf-utils

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
apt-get install -y node httpie vim curl
