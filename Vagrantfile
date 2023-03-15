# -*- mode: ruby -*-
# vi: set ft=ruby :


dir = Dir.pwd
vagrant_dir = File.expand_path(File.dirname(__FILE__))

$vm_box = ENV['BOX'] ? ENV['BOX'] : 'generic/ubuntu2204'

#vm_hostname = 'morsh-vagrant-ubuntu-18-04'

Vagrant.require_version '>= 2.2.0'
VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
   
    box_name = $vm_box

    app_servers ={

      'gitlab-runner-1' => {
           :name => 'gitlab-runner-1',
           :ip => '192.168.56.2',
           :box => box_name,
           :forwarded_port_guest => 8080,
           :forwarded_port_host => 8080
       }
    }

    app_servers.each do |key,value|
        boxname = value[:name]

        config.vm.define boxname do |app_config|

            app_config.vm.provider :virtualbox do |vb|
               vb.gui = false 
               vb.name = "#{value[:name]}.morsh-vagrant"
               vb.memory = 4096
               vb.cpus = 2         
            end    

            app_config.vm.box = value[:box]

            app_config.vm.hostname = "#{value[:name]}.morsh-vagrant"

            app_config.vm.network "private_network", ip: value[:ip]

            app_config.vm.network "forwarded_port", guest: value[:forwarded_port_guest], host: value[:forwarded_port_host]
      

            app_config.ssh.forward_agent = true

            config.vm.provision "ansible" do |ansible|
                ansible.galaxy_role_file = "requirements.yml"
                ansible.host_key_checking = false
                ansible.groups = {
                             "shell_runners" => ["gitlab-runner-1"],
                             "docker_runners"  => ["gitlab-runner-2"]
                            }
                ansible.playbook = "provisioning.yaml"
                ansible.vault_password_file = "~/.vault_pass_B11-5"
                ansible.raw_arguments = [
                    "--connection=paramiko",
                    "--private-key=/home/morsh92/.ssh/vagrant_key"
                  ]
            end
        end
    end
end            