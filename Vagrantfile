# Add lib to our loading path
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

# Can you think of how to do this better? I'll leave this to you!
nodes = {
  'web' => {
    :hostname => 'web-server.example.com',
    :ipAddress => '192.168.56.60',
  },
  'db' => {
    :hostname => 'db-server.example.com',
    :ipAddress => '192.168.56.70',
  }
}

# We don't use this for anything now, but you can in the future!
config_file_path = File.join(File.dirname(File.expand_path(__FILE__)), 'config.yaml')
config_file_defaults_path = File.join(File.dirname(File.expand_path(__FILE__)), 'config.yaml.defaults')

require 'config_manager'
config_manager = ConfigManager.new(config_file_defaults_path, config_file_path)
vagrant_config = config_manager.load()

Vagrant.configure("2") do |config|
  nodes.each_pair do |name, options|
    machineName = options[:hostname]
    ipAddy = options[:ipAddress]
    config.vm.define name do |node|
      node.vm.box = 'centos-6.4-x86_64-vagrant-puppet'
      node.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box'
      node.vm.hostname = machineName
      node.vm.network :private_network, ip: ipAddy
      node.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests/"
        puppet.manifest_file = "init.pp"
        puppet.module_path = "modules/"
        puppet.options = "--hiera_config /vagrant/hiera.yaml"

        facts = {
          'custom_fact' => 'custom value'
        }

        # We can make our entire config available from puppet as well
        puppet.facter = facts.merge(vagrant_config)
      end
    end
  end
end
