def provision_devstack(config, local_conf:'local.conf', local_sh: nil, env: nil)
    config.vm.provision :shell, privileged:true, path: '../scripts/rhel-devstack.sh'
    config.vm.provision :shell do |shell|
        shell.privileged = false
        shell.path = '../scripts/devstack.sh'
        shell.args = [ local_conf ]
        if local_sh != nil then
            shell.args << local_sh
        end
        if env != nil then
            shell.env = env
        end
    end
end
