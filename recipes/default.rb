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

include_recipe "dataloop-chef::#{node['dataloop']['agent']['install_method']}"

template node['dataloop']['agent']['conf_file'] do
  path "#{node['dataloop']['agent']['conf_dir']}/#{node['dataloop']['agent']['conf_file']}"
  source "agent.conf.erb"
  owner "dataloop"
  group "dataloop"
  mode 0600
  notifies :restart, "service[dataloop-agent]", :delayed
end

unless node['dataloop']['agent']['api_key'].nil?
  service "dataloop-agent" do
    supports :status => true, :restart => true, :reload => false
    action [ :enable, :start ]
  end
end
