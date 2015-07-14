Dataloop-agent Cookbook
=================
This cookbook installs the dataloop.io agent on a host.

Requirements
------------
* Chef 11 or higher
* see metadata.rb for cookbook dependencies

Platforms
---------
* Ubuntu 10.04, 12.04, 140.4
* Rhel/Centos >= 6

Optional
------------
Encrypted Data Bag called dataloop/keys to store the API key securely.

Attributes
----------
* node['dataloop']['agent']['install_method'] : Methods of install are _package_ or _bash_. Currently the bash method does not work but it intended to satisfy non-deb or non-rpm environments. 
* node['dataloop']['agent']['version'] : Choose the version of agent to install. Set to _nil_ for the latest.
* node['dataloop']['agent']['api_key'] : __REQUIRED__ you must set this to the api_key for you account. Your servers will need it to communicate with dataloop.io. It is stored on you servers in a protected file.
* node['dataloop']['agent']['deregister_onstop'] : Choose whether to deregister the agent when stopping the service
* node['dataloop']['agent']['solo_mode'] : Whether you run in solo mode with RPC turned off
* node['dataloop']['agent']['debug'] : Debugging flag
* node['dataloop']['agent']['tags'] : An array of tags to associate to this agent
* node['dataloop']['agent']['name'] : A custom name for this agent, default will be hostname if not set


Usage
-----
Import this cookbook into your environment:

* Berkshelf:
  * cookbook "dataloop-agent", git: "https://github.com/dataloop/dataloop-chef", tag: "v1.0.2"
  
* Librarian:
  * cookbook 'dataloop-agent', :git => 'https://github.com/dataloop/dataloop-chef', :ref => 'v1.0.2'


Include the default recipe in your nodes run list and set at least your api key

```
{
  default_attributes: {
    dataloop: {
      agent: {
        api_key: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
      }
    }
  },
  run_list: [
    recipe[dataloop-agent]
  ]
}
```

Tags
----
Use `node['dataloop']['agent']['tags']` to setup automatic tags so you don't need to set them in the web UI


Testing
-------
You can use test-kitchen 
Testing for this cookbook has been setup with Librarian-chef and Test-Kitchen utilising vagrant as the machine provider

* Clone the repository
* copy .kitchen.yml to a local version .kitchen.local.yml (this is not checked into git)
* edit the api_key attribute in .kitchen.local.yml with your value
* run `kitchen test` or `kitchen test <machine name>`

Contributing
------------
Pull requests welcome.

License and Authors
-------------------
Author: Tom Ashley <tom.ashley@dataloop.io>
Author: Steven Acreman <steven.acreman@dataloop.io>

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.


Deprecated / In development
---------------------------

Create an encrypted data bag named dataloop/keys with the following content and place
the secret key in /etc/chef/edbkeys/dataloop.key on each node that you
want to use this cookbook with.

```json
{
      "id": "keys",
      "api": "YOUR API KEY"
}
```
Now include `dataloop` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dataloop]"
  ]
}
```
