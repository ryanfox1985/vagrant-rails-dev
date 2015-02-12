# -*- mode: ruby -*-
# vi: set ft=ruby :

project_name = 'example'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Enable Berkshelf support
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = './Berksfile'


  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'ubuntu/trusty64'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network 'forwarded_port', :guest => 3000, :host => 9000
  config.vm.network 'forwarded_port', :guest => 3306, :host => 9306

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider 'virtualbox' do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    #   vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    vb.memory = '1024'
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrvantup.com/v2/push/atlas.html for more information.
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

  # Enable and configure chef solo
  config.vm.provision :chef_solo do |chef|
    chef.provisioning_path = '/home/vagrant/provision'
    chef.file_cache_path = chef.provisioning_path

    chef.json = {
        :mysql => {
            :server_type => 'mysql',
            :server_database => "#{project_name}-dev",
            :server_root_user => 'root',
            :server_root_password => 'root',
            :server_host => '127.0.0.1',
            :server_port => '3306'
        },
        :rvm => {
            :app_gemset => "#{project_name}",
            :rubies => ['2.1.0'],
            :default_ruby => 'ruby-2.1.0',
            :user_default_ruby => 'ruby-2.1.0rake',
            :vagrant => {:system_chef_solo => '/opt/chef/bin/chef-solo'}
        }
    }

    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'git'
    chef.add_recipe 'nodejs'

    chef.add_recipe 'rvm::system'
    chef.add_recipe 'rvm::vagrant'

    chef.add_recipe 'app::utf8'
    chef.add_recipe 'app::packages'
    chef.add_recipe 'app::mysql'
    chef.add_recipe 'app::gemset'
    chef.add_recipe 'app::environment'
    chef.add_recipe 'app::post-install'
  end

end
