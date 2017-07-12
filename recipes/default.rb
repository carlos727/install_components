# Cookbook Name:: install_components
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#--- Variables ------#
mail_to = node["mail"]["to"]
message = "Cookbook install_components finished successfully in Node #{Chef.run_context.node.name} !"

#--- Main process---#
include_recipe 'install_components::wmdc'

include_recipe 'install_components::registry_key'

include_recipe 'install_components::netsh_commands'

include_recipe 'install_components::configkey_file'

include_recipe 'install_components::cipherlab_mds'

ruby_block 'Send Email' do
  block do
    Chef::Log.info(message)
    Tools.send_email mail_to, :message => message
  end
end
