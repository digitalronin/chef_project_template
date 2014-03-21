#!/bin/bash

# This runs as root on the server

chef_binary=/usr/local/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    export DEBIAN_FRONTEND=noninteractive

    # Add repo for ruby 2
    apt-get update
    apt-get install -y python-software-properties
    add-apt-repository -y ppa:brightbox/ruby-ng-experimental
    apt-get update

    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    apt-get -o Dpkg::Options::="--force-confnew" \
        --force-yes -fuy dist-upgrade &&

    apt-get install -y ruby2.0 ruby2.0-dev ruby2.0-doc
    update-alternatives --set ruby /usr/bin/ruby2.0

    apt-get install -y build-essential

    # Install Ruby and Chef
    sudo gem install --no-rdoc --no-ri chef --version 11.10.4
fi &&

"$chef_binary" -c solo.rb -j server.json
