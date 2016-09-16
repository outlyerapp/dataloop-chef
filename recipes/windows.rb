windows_package 'dataloop-agent' do
  source 'https://download.dataloop.io/windows/latest/dataloop-agent-1.1.32-1_x86.exe'
  remote_file_attributes ({
    :checksum => '2cd19b931355e23eee095ffd4d8140cfe3625741eff503615c821907a3dcd546',
    :path => 'C:\\dataloop-agent.exe'
  })
  #installer_type :custom
  options ''
end

template node['dataloop']['agent']['conf_file'] do
  path 'c:\dataloop\agent.yaml'
  source "agent.yaml.erb"
  notifies :restart, "windows_service[dataloop-agent]", :delayed
end

windows_service 'dataloop-agent' do
  action :configure_startup
  startup_type :manual
end
