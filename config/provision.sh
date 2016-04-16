export LATEST_RUBY=2.3.0

# Upgrade system and install dependancies
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y language-pack-en build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ssl-cert subversion language-pack-en debconf-utils

# Install rbenv
git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
cd /home/vagrant/.rbenv && sudo src/configure && sudo make -C src
sudo chown vagrant /home/vagrant/.rbenv

# Install ruby-build and rbenv-gem rehash
git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
git clone git://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash

# Set Default rubygems to include in all ruby installations via rbenv
echo "bundler\nbrice\nhirb\ngist\npry\npry-doc\nawesome_print\nspecific_install" > /home/vagrant/.rbenv/default-gems

# Install Rubies
rbenv install $LATEST_RUBY
rbenv rehash
rbenv install 2.1.9
rbenv rehash
rbenv global $LATEST_RUBY

# Update rubygems and install standard gems
gem update --no-ri --no-rdo --system
gem install --no-ri --no-rdo bundler brice pry pry-nav pry-doc json awesome_print

# Install Redis (http://vvv.tobiassjosten.net/linux/installing-redis-on-ubuntu-with-apt/)
sudo chown -R vagrant /etc/apt
echo "# /etc/apt/sources.list.d/dotdeb.org.list" > /etc/apt/sources.list.d/dotdeb.org.list
echo "deb http://packages.dotdeb.org squeeze all" >> /etc/apt/sources.list.d/dotdeb.org.list
echo "deb-src http://packages.dotdeb.org squeeze all" >> /etc/apt/sources.list.d/dotdeb.org.list
wget -q -O - http://www.dotdeb.org/dotdeb.gpg | sudo apt-key add -
sudo chown -R root /etc/apt

sudo apt-get update
sudo apt-get install -y redis-server

# Install MongoDB
sudo chown -R vagrant /etc/apt
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo chown -R root /etc/apt
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install MySQL Server
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server

# Install Extra Development tools
sudo apt-get install -y node httpie vim curl
