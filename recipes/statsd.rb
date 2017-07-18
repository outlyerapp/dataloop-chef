include_recipe 'dataloop-agent'

template 'statsd yaml' do
  path "#{node['dataloop']['agent']['conf_dir']}/#{node['dataloop']['agent']['statsd_file']}"
  source "statsd.yaml.erb"
  owner "root"
  group "dataloop"
  mode 0640
  notifies :restart, "service[dataloop-agent]", :delayed
end
