#
# Author:: Edward Nunez(edward.nunez@cyberark.com)
# Author:: CyberArk Business Development (<business_development@cyberark.com>)
# Cookbook:: cyberark
# Resource:: cyberark_credential
#
# Copyright:: 2017, CyberArk Software
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

require 'cyberark_credential'

resource_name :cyberark_credential

property :name, String, name_property: true
property :app_id, String
property :query, String
property :base_url, String, default: "http://__PLEASE_SET_BASE_URL__"
property :use_ssl, [true, false], default: true

action :read do

  begin

    # Retrieve credential using cyberark_credential rubygem
    req = CyberArk::Credential.new(new_resource.base_url, new_resource.use_ssl)
    account = req.get(new_resource.app_id, new_resource.query)

    if account.nil?
      raise "Could not find credential matching query: `#{query}'!"
    end

    # Persist the secret in-memory for the rest of this Chef run.
    node.run_state[new_resource.name] = account

    # Tell notifications to fire.
    updated_by_last_action(true)

  rescue
    raise "Could not find credential matching query: `#{query}'!"
  end

end

