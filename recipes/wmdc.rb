# Cookbook Name:: install_components
# Recipe:: wmdc
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#--- logs ---#
log 'driver_setup.exe downloaded !' do
  action :nothing
end

log 'drvupdate-amd64.msi downloaded !' do
  action :nothing
end

log 'Centro de Dispositivo de Windows Mobile installed !' do
  action :nothing
end
#--- ---#

# Download driver_setup.exe from remote source.
remote_file 'C:\InstalacionPDT\driver_setup.exe' do
  source node[:wmdc][:driver]
  notifies :write, 'log[driver_setup.exe downloaded !]', :immediately
  only_if { File.directory?("C:\\InstalacionPDT") && !File.exist?("C:\\InstalacionPDT\\driver_setup.exe") }
end

# Download drvupdate-amd64.msi from remote source.
remote_file 'C:\InstalacionPDT\drvupdate-amd64.msi' do
  source node[:wmdc][:installer]
  notifies :write, 'log[drvupdate-amd64.msi downloaded !]', :immediately
  only_if { File.directory?("C:\\InstalacionPDT") && !File.exist?("C:\\InstalacionPDT\\drvupdate-amd64.msi")}
end

batch 'Install Windows Mobile Device Center 6.1' do
  code <<-EOH
    cd C:\\InstalacionPDT
    driver_setup.exe /i drvupdate-amd64.msi
    EOH
  notifies :write, 'log[Centro de Dispositivo de Windows Mobile installed !]', :immediately
  only_if { File.directory?("C:\\InstalacionPDT") }
end
