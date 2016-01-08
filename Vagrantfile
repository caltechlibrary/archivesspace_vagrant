# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # forward the public admin site
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # forward the public website
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  # forward the API
  config.vm.network "forwarded_port", guest: 8089, host: 8089
  # forward the Solr admin site
  config.vm.network "forwarded_port", guest: 8090, host: 8090
  # forward NginX
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 443, host: 8443

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  config.vm.provider "virtualbox" do |vb|
   # Display the VirtualBox GUI when booting the machine
   vb.gui = false
   # Customize the amount of memory on the VM:
   vb.memory = "2048"
   vb.cpus = 4
   # Example custom settings: v.customize ["modifyvm", :id, "--vram", "<vramsize in MB>"]
   vb.customize ["modifyvm", :id, "--vram", "128"]
  end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  config.vm.provision "shell", inline: <<-SHELL
    # Setup the base system with development tools
    sudo yum -y install git
    sudo yum -y install curl
    sudo yum -y install zip unzip
    sudo yum -y install epel-release
    sudo yum -y install deltarpm
    # Install Java 1.7 and related tools
    sudo yum -y install java-1.7.0-openjdk-devel.x86_64 java-1.7.0-openjdk-javadoc.noarch
    sudo yum -y install ant-javadoc.noarch ant-contrib-javadoc.noarch ant-antunit-javadoc.noarch
    sudo yum -y install maven.noarch
    # Replace Apache/install NginX
    sudo yum -y remove httpd
    sudo yum -y install nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    # Setup and install MySQL server from Oracle.
    sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
    sudo yum -y install mysql-server
    #sudo adduser archivesspace
    echo ''
    echo ' Run'
    echo '    vagrant ssh'
    echo ' and then run'
    echo '    cd $HOME/sync && bash setup/final-installation-steps.sh'
    echo ' To complete the installation.'
    echo ''
    echo ''
  SHELL
end
