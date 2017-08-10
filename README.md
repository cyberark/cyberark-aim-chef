# cyberark Cookbook

Contains custom resource `cyberark_credential` and a default sample cookbook. It retrieves credential from CyberArk vault using AIM API (connecting to AIM Central Credential Provider.)

It requires `cyberark_credential` gem.

## Requirements

### Platforms

- All platforms supported by Chef

### Chef

- Chef 12.1+

### Cookbooks

- none

## Custom Resources

### `cyberark_credential`

#### Actions

- `:read` - Retrieves credential from CyberArk vault using AIM API (connecting to AIM Central Credential Provider)

#### Properties

- `name` - Name attribute. The name of the value to be stored in the registry
- `app_id` - ID for Application defined in CyberArk
- `query` - The query to match the credential to be retrieved
- `base_url` - The base URL for CyberArk AIM Central Credential Provider
- `use_ssl` - Whether to use HTTP (false) or HTTPS (true) when making the API call

#### Examples

Retrieves CyberArk credential for account which matches criteria "Safe=Test;Folder=Root;Object=Object", 
and creates a file named /tmp/test.txt with information received from CyberArk.

```ruby
chef_gem 'cyberark_credential' do
  compile_time true
end

cyberark_credential "cred1" do
  app_id "Chef_App"
  query "Safe=Test;Folder=Root;Object=Object"
  notifies :create, "file[/tmp/test.txt]", :immediately
  base_url "http://192.168.86.162"
  use_ssl false
end

file '/tmp/test.txt' do
	sensitive true
	content lazy { "!USERNAME=#{node.run_state['cred1']['UserName']}\nPASSWORD=#{node.run_state['cred1']['Content']}\nDatabase=#{node.run_state['cred1']['Database']}\n" }
	only_if { node.run_state.key?('cred1') }
end
```

## License & Authors

- Author::  CyberArk BizDev Team ([business_development@cyberark.com](mailto:business_development@cyberark.com))

```text
Copyright 2017, CyberArk Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```