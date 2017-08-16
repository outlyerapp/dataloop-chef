default['dataloop']['agent']['install_method'] = 'package' # package or bash
default['dataloop']['agent']['keep_old_config'] = nil # or true to keep old config
default['dataloop']['agent']['version'] = nil
default['dataloop']['agent']['solo_mode'] = 'no'
default['dataloop']['agent']['debug'] = 'no'
default['dataloop']['agent']['docker'] = 'no'

default['dataloop']['agent']['init'] = "/etc/init.d/dataloop-agent"
default['dataloop']['agent']['run_dir'] = "/opt/dataloop/plugins/rpc"
default['dataloop']['agent']['log_dir'] = "/var/log/dataloop"
default['dataloop']['agent']['conf_dir'] = "/etc/dataloop"
default['dataloop']['agent']['conf_file'] = "agent.yaml"
default['dataloop']['agent']['statsd_file'] = "statsd.yaml"
default['dataloop']['agent']['init_vars_file'] = 'dataloop-agent'
default['dataloop']['agent']['deregister_onstop'] = 'yes' # or no

case node['platform_family']
when 'rhel', 'fedora'
  default['dataloop']['agent']['init_vars_dir'] = '/etc/sysconfig'
when 'debian'
  default['dataloop']['agent']['init_vars_dir'] = '/etc/default'
end

default['dataloop']['agent']['api_key'] = nil
default['dataloop']['agent']['server'] = "wss://agent.dataloop.io"

# array of tags to apply to node
default['dataloop']['agent']['tags'] = nil
default['dataloop']['agent']['name'] = nil
