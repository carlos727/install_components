# Cookbook Name:: install_components
# Recipe:: netsh_commands
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# log
log 'NETSH commands executed !' do
  action :nothing
end

# Execute NETSH commands
batch 'User Authorization' do
  code <<-EOH
    NETSH http add urlacl http://*:10281/ user="#{node["cuser"]}"
    NETSH http add urlacl http://%COMPUTERNAME%:10281/ user="#{node["cuser"]}"
    NETSH http add urlacl http://#{node['ipaddress']}:10281/ user="#{node["cuser"]}"
    EOH
  notifies :write, 'log[NETSH commands executed !]', :immediately
  ignore_failure true
end
