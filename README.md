Dataloop Cookbook
=================
Installs the dataloop.io agent on a host

Requirements
------------
Chef 11 or higher

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
* node['dataloop']['agent']['api_key'] : __REQUIREd__ you must set this to the api_key for you account. Your servers will need it to communicate with dataloop.io. It is stored on you servers in a protected file.

Usage
-----
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
