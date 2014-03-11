dataloop Cookbook
=================
Installs the dataloop.io agent on a host

Requirements
------------

None

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
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

Just include `dataloop` in your node's `run_list`:

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
