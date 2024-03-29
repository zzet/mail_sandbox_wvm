# You can ask for more memory and cores when creating your Vagrant machine:
# wvm_VAGRANT_MEMORY=1536 wvm_VAGRANT_CORES=2 vagrant up
MEMORY = ENV['wvm_VAGRANT_MEMORY'] || '1024'
CORES = ENV['wvm_VAGRANT_CORES'] || '1'

Vagrant::Config.run do |config|
  config.vm.box = "mail_sandbox"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  #config.vm.network :hostonly, '192.168.111.111'
  #config.vm.network :bridged, bridge: "en0: Wi-Fi (AirPort)"
end

Vagrant.configure("2") do |config|
  config.vm.provider :vmware_fusion do |v, override|
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"
    v.vmx["memsize"] = MEMORY
    v.vmx["numvcpus"] = CORES
  end


  config.vm.provider :virtualbox do |v, override|
    v.customize ["modifyvm", :id, "--memory", MEMORY.to_i]
    v.customize ["modifyvm", :id, "--cpus", CORES.to_i]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.verbose = "vv"
  end

  config.vm.network :private_network, ip: '192.168.111.111'

  # Default user/group id for vagrant in precise32
  host_user_id = 1000
  host_group_id = 1000

  if RUBY_PLATFORM =~ /linux|darwin/
    config.vm.synced_folder("./project", "/rest/u/mail_sandbox/apps/mail_sandbox/current", nfs: true)
    host_user_id = Process.euid
    host_group_id = Process.egid
  end
end
