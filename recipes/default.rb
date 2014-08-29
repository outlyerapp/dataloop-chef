#
# Cookbook Name:: dataloop
# Recipe:: default
#
# Copyright 2013, Dataloop Software Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Setup the user account that we will run as
user node['dataloop']['node']['user'] do
    action :create
    supports :mange_home => true
    comment "Dataloop User Account"
    home node['dataloop']['agent']['run_dir']
end

remote_file node['dataloop']['agent']['bin_dir'] do
  source node['dataloop']['agent']['uri']
  checksum node['dataloop']['agent']['checksum']
  mode 0755
end

directory node['dataloop']['agent']['run_dir'] do
  action :create 
  owner node['dataloop']['node']['user']
  group node['dataloop']['node']['user']
  mode 0755
  recursive true
end

directory "#{node['dataloop']['agent']['run_dir']}" do
  action :create 
  owner node['dataloop']['node']['user']
  group node['dataloop']['node']['user']
  mode 0755
  recursive true
end


directory node['dataloop']['agent']['log_dir'] do
  action :create 
  owner node['dataloop']['node']['user']
  group node['dataloop']['node']['user']
  mode 0755
end

directory node['dataloop']['agent']['conf_dir'] do
  action :create 
  owner node['dataloop']['node']['user']
  group node['dataloop']['node']['user']
  mode 0755
end

dataloop_secret = Chef::EncryptedDataBagItem.load_secret("#{node[:dataloop][:node][:secret_key_file]}")
dataloop_keys = Chef::EncryptedDataBagItem.load("dataloop", "keys", dataloop_secret)

template node['dataloop']['agent']['init'] do
  source "dataloop-agent.erb"
  owner "root"
  group "root"
  mode 0755
  variables({
      :api_key => dataloop_keys['api']
  })
end

## I'm not particularly proud of this but for some reason the
#permissions on /opt/dataloop keep being reset to "root:root",
#preventing the agent from starting properly.
#
#This bash script forces the permissions to the correct settings and
#allows the agent to start properly.
bash "hack permissions" do
    user "root"
    cwd  "/opt"
    code <<-EOH
    chown -Rvf dataloop:root /opt/dataloop
    EOH
end

service "dataloop-agent" do
  action [ :enable, :start ]
end
