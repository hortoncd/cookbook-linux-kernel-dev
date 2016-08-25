#
# Cookbook Name:: linux-kernel-dev
# Recipe:: default
#
# Copyright 2016, Chris Horton
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

include_recipe 'build-essential'

case node['platform_family']
when 'debian'
  %w{ exuberant-ctags }.each do |p|
    package p
  end
when 'rhel'
  package 'ca-certificates' do
    case node['platform_version'].to_i
    when '6'
      version '2015.2.6-65.0.1.el6_7'
    end
  end

  include_recipe 'yum-epel'

  %w{ ctags }.each do |p|
    package p
  end
end

%w{ mutt esmtp git git-email vim }.each do |p|
    package p
end

file '/etc/profile.d/01vimode.sh' do
  owner 'root'
  group 'root'
  mode '644'
  content 'set -o vi'
end