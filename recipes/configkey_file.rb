# Cookbook Name:: install_components
# Recipe:: configkey_file
# 
# Copyright (c) 2016 The Authors, All Rights Reserved.

# log
log "File configkey.config Edited ValidAddressHost = #{node['ipaddress']} !" do
  action :nothing
end

# Edit configkey.config file
template 'C:\PDT\LocalFiles\configkey.config' do
  source 'configkey.erb'
  notifies :write, "log[File configkey.config Edited ValidAddressHost = #{node['ipaddress']} !]", :immediately
end
