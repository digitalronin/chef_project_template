Chef Project Template
=====================

Starting point for an Ubuntu 12.04 server, managed with chef-solo

This is a starting point for a project using;

* Ubuntu 12.04
* Ruby 2.0
* Chef
* Vagrant (for development VMs)

# Pre-requisites

Ruby >=1.9 (on your development machine)
VirtualBox  https://www.virtualbox.org/
Vagrant     http://vagrantup.com

You will need the hashicorp/precise64 box for vagrant.
If you don't have it already, get it like this;

    $ vagrant box add hashicorp/precise64

# Deployment instructions

Edit the Vagrantfile and replace my SSH public key
with yours. Then;

    $ ./bootstrap_vagrantvm

This will boot a Vagrant VM, install ruby 2.0 and chef, and then
execute the runlist in server.json

I've setup a simple recipe to install NTP and set the timezone,
just so that you have something to build from.

The process is almost identical when deploying to any other
(Ubuntu 12.04) server. You just skip the vagrant part;

    $ cd chef
    $ ./deploy.sh root@[server IP number]

You should also run this whenever you want to update the server
with the latest changes you've made to your chef code.

This project is inspired by (copied from) this truly excellent
blog post;

* [Chef Solo tutorial: Managing a single server with Chef](http://www.opinionatedprogrammer.com/2011/06/chef-solo-tutorial-managing-a-single-server-with-chef/)
