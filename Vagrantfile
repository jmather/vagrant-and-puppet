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
      end
    end
  end
end
