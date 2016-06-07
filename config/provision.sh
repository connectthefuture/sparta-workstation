#/bin/bash

export LATEST_RUBY=2.3.0
echo "------------------- Running as user: $(whoami) -------------------"

# Install rbenv
# export RBENV_ROOT="/home/vagrant/.rbenv"
git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
cd /home/vagrant/.rbenv && src/configure && make -C src

# Install ruby-build and rbenv-gem rehash
git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
git clone git://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash

# Set Default rubygems to include in all ruby installations via rbenv
echo "bundler\nbrice\nhirb\ngist\npry\npry-doc\nawesome_print\nspecific_install" > /home/vagrant/.rbenv/default-gems
# source "/home/vagrant/.bash_profile"

# Install Rubies
rbenv install $LATEST_RUBY
rbenv rehash
#rbenv install 2.1.9
#rbenv rehash
rbenv global $LATEST_RUBY

# Update rubygems and install standard gems
gem update --no-ri --no-rdo --system
gem install --no-ri --no-rdo bundler brice pry pry-nav pry-doc json awesome_print

# Install vim-plug

echo "------------------- Installing Vim Plug -------------------"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "------------------- Running Vim Plug Commands -------------------"

vim +PlugInstall +qall
vim +PlugClean +qall

# Remove postinstall script that comes with hashicorp/precise32 box.
rm -f /home/vagrant/postinstall.sh

# Remove pip temporary build folder if it exists
rm -fr /home/vagrant/build
echo "------------------- Done running provisioning scripts -------------------"
