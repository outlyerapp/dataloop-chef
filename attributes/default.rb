default['dataloop']['agent']['install_method'] = 'package' # package or bash
default['dataloop']['agent']['version'] = nil

default['dataloop']['agent']['init'] = "/etc/init.d/dataloop-agent"
default['dataloop']['agent']['run_dir'] = "/opt/dataloop/plugins/rpc"
default['dataloop']['agent']['log_dir'] = "/var/log/dataloop"
default['dataloop']['agent']['conf_dir'] = "/etc/dataloop"
default['dataloop']['agent']['conf_file'] = "agent.conf"
default['dataloop']['agent']['api_key'] = nil
default['dataloop']['agent']['server'] = 'https://www.dataloop.io'

default['dataloop']['node']['tags'] = "all"
default['dataloop']['node']['user'] = "dataloop"
default['dataloop']['node']['secret_key_file'] = "/etc/chef/edbkeys/dataloop.key"
