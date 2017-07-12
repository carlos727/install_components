# Cookbook Name:: install_components
# Recipe:: registry_key
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# log
log 'Registry key created !' do
  action :nothing
end

# Create registry key
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows CE Services\AutoStartOnConnect' do
  values [{
    :name => 'InventarioPDT',
    :type => :string,
    :data => "C:\\Users\\#{node["cuser"]}\\Desktop\\InventarioSync.appref-ms"
  }]
  action :create
  notifies :write, 'log[Registry key created !]', :immediately
end
