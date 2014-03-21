# -*- mode: ruby -*-
# vi: set ft=ruby :

$setup_root_ssh = <<EOF
mkdir /root/.ssh 2>/dev/null
chmod 700 /root/.ssh
KEY='ssh-dss AAAAB3NzaC1kc3MAAACBALNahM9/fW5iyWgoYtr4ZafMWPHqvfCRZgoliWH13icCzVBUwMD+tItiTOVlAMWwA2ni7oVKWZmc160jAT9M+Tv05/RdrHlpNTyUrlWE0UmAoXwso9OXtGhzi3BCzfX39Il698q/OeEZGQHqlGmYhd/AOSAdtdRpGM52InOjdbyPAAAAFQCp2h4//X/KGD3DeoTnlY2/u3An8QAAAIACB8mqZITyavNAB12mMYhbBdpC2z1oUCHioYNdBU2bnANJwz7VDeQuMJ+AAa6uOiCcz5JFCtkKYrltOoO8WNbbuIIAqUbVZYmz/aA5WYWHyW/9dyIkKQV8cF4c8A76nWrp05+8G7CrFLupQ8nEXy4E3sA+j/XaYnUpjpjkN3b2CQAAAIEAoJlQSe2bA6WndIn6q+wnBf3+LjSokza9JBuxfM8RNX4EF6OguQYLUz2YNDjFxtjtuv+cBxFhAzdJv63kdref3JR1FMOLBG6mrQ6EbDe/BglN+Vo0Ffx6c8T/qjzmeKiL3hqYEMORSzfRxqAznft0eSyLF18bIbQrdercq3su/OM= amoda_dsa.keypair'
echo $KEY > /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys
EOF

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box       = "hashicorp/precise64"
  config.vm.host_name = "myserver"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :private_network, ip: "192.168.11.11"
  config.ssh.forward_agent = true
  config.vm.provision "shell", inline: $setup_root_ssh
end
