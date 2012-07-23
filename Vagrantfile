#!/usr/bin/env ruby

# == DOCS:
#   http://vagrantup.com/v1/docs/vagrantfile.html

Vagrant::Config.run do |config|

  # VM: Default
  config.vm.define :default do |default|

    default.vm.customize ['modifyvm', :id, '--memory', 512, '--cpus', '4']

    default.vm.box = 'base'
    # default.vm.box_url = "http://files.vagrantup.com/lucid64.box"

    default.vbguest.auto_update = true
    default.vbguest.no_remote = true

    # default.vm.boot_mode = :gui

    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    #
    default.vm.network :hostonly, '192.168.1.100'

    # Forward a port from the guest to the host, which allows for outside
    # computers to access the VM, whereas host only networking does not.
    #
    default.vm.forward_port 80, 8000

    # Share an additional folder to the guest VM.
    #
    default.vm.share_folder 'v-data', '/data', File.expand_path('../data', __FILE__)

    # Provisioning: Chef Solo
    #
    default.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ['cookbooks']

      chef.add_recipe 'apt'
      chef.add_recipe 'build-essential'
      chef.add_recipe 'git'
      chef.add_recipe 'rvm::system'
      chef.add_recipe 'rvm::vagrant'

      # You may also specify custom JSON attributes:
      chef.json = {
        'rvm' => {
          'rubies' => ['1.9.3'],
          'default_ruby' => '1.9.3',
          'global_gems' => [
            {'name' => 'bundler'},
            {'name' => 'rake'}
          ],
          'vagrant' => {
            'system_chef_solo' => '/opt/vagrant_ruby/bin/chef-solo'
          }
        }
      }
    end

    # Provisioning: Shell
    #
    config.vm.provision :shell do |shell|
      shell.inline = 'cd /vagrant && sh ./scripts/devstructure-blueprint/install.sh'
    end
  end

end
