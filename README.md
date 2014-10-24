dataloop Cookbook
=================
Installs the dataloop.io agent on a host

Requirements
------------

Encrypted Data Bag called dataloop/keys to store the API key securely.

Attributes
----------
#### dataloop::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['dataloop']['apikey']</tt></td>
    <td>string</td>
    <td>API Key to use when communicating back with dataloop.io</td>
    <td><tt>NULL</tt></td>
  </tr>
</table>

Usage
-----
#### dataloop::default

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

Contributing
------------
N/A

License and Authors
-------------------
None
