#
# Author:: Edward Nunez (<edward.nunez@cyberark.com>)
# Author:: CyberArk Business Development (<business_development@cyberark.com>)
# Cookbook:: cyberark
# Attributes:: default
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

default['cyberark']['app_id'] = 'Chef-App'
default['cyberark']['query'] = 'Safe=Test;Folder=Root;Object=Object'
default['cyberark']['base_url'] = 'http://__PLEASE_SET_BASE_URL__'
default['cyberark']['use_ssl'] = true

