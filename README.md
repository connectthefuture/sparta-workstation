# Sparta Global Workstation

## Installation and Usage

1. [Install Vagrant](https://www.vagrantup.com/downloads.html)
2. [Install Virtualbox](https://www.virtualbox.org/wiki/Downloads)
3. Clone this repo to somewhere sensible on your machine.
4. Run `vagrant up`.
5. Wait for the provisioning scripts to run. This could take up to two hours, depending on the speed of the internet.
5. Remove the git and dotfiles directories with `rm -rf .git config/dotfiles`.
6. Log into your new VM with `vagrant ssh`.

## Your `work` directory.

This directory is shared between the Workstation VM and your host OS. You can add and edit files in here, and access the in the VM (and vice-versa).

The `work` folder also contains a `learning-bash` folder, which is used during the initial bash lessons, and a `sql` folder, which is used during the SQL lessons.

## What's on the workstation?

* Ubuntu 14.04 Trusty Tahr 64-bit with upgraded packages
* Redis
* MongoDB
* MySQL Server
* Node.js
* Vim
* Curl
* Upgraded Pip
* HTTPie
* Rbenv
* The latest stable ruby
* These gems: bundler, brice, pry, json, awesome-print (which will also be installed with anyh new rbenv rubies)

Initial configuration for bash, vim, pry, irb and git is also included in the form of dotfiles.

## Contributions
Contributions are most welcome, particularly from current or past Spartans..

If you make changes to your dotfiles which you feel might be useful for other Spartans, feel free to fork and open a pull request. (If you add new dotfiles, you'll need to update the Vagrantfile too).

Anyone volunteers to convert provision.sh to a Chef cookbook would be most welcome, particularly if it includes TestKichen tests!

## License & Copyright
Copyright (c) Testing Circle Ltd. All Rights Reserved except where otherwise noted. If you are the author of any code and are not attributed, raise in issue or submit a pull request and we'll include an attribution and link.
