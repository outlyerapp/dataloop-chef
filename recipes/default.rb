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

remote_file node['dataloop']['agent']['bin_dir'] do
  source node['dataloop']['agent']['uri']
  checksum node['dataloop']['agent']['checksum']
  mode 0755
end

directory node['dataloop']['agent']['run_dir'] do
  action :create 
  owner node['dataloop']['node']['user']
  group "root"
  mode 0755
  recursive true
end

execute "user owns run dir" do
  command "chown -R node['dataloop']['node']['user'] node['dataloop']['agent']['run_dir']"
end

directory node['dataloop']['agent']['log_dir'] do
  action :create 
  owner node['dataloop']['node']['user']
  group "root"
  mode 0755
end

directory node['dataloop']['agent']['conf_dir'] do
  action :create 
  owner node['dataloop']['node']['user']
  group "root"
  mode 0755
end

template node['dataloop']['agent']['init'] do
  owner "root"
  group "root"
  mode 0755
end

service "dataloop-agent" do
  action [ :enable, :start ]
end
