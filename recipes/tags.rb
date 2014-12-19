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

# TODO get existing tags from DL and only push new tags
# TODO Store DL tags in ohai

if node['dataloop']['agent']['tag_generic']
    # use a set of attributes from ohai to tag node
    tags = Array.new()
    tags += node['roles']
    tags.push(node['platform'])
    node.set['dataloop']['agent']['tags'] = tags
end

execute 'tag agent' do
    user 'dataloop'
    command "dataloop-agent -a #{node['dataloop']['agent']['api_key']} --add-tags #{node['dataloop']['agent']['tags'].join(',')}"
    not_if node['dataloop']['agent']['tags'].nil?
end
