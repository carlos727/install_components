# Cookbook Name:: install_components
# Recipe:: cipherlab_mds
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# log
log 'Cipherlab MDS installed !' do
  action :nothing
end

batch 'Install Cipherlab MDS' do
  code <<-EOH
    cd C:\\InstalacionPDT
    MDSsetup.exe /SILENT
    EOH
  notifies :write, 'log[Cipherlab MDS installed !]', :immediately
end
