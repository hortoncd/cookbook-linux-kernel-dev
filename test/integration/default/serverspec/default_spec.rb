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

require 'spec_helper'

describe 'linux-kernel-dev::default' do

  case os[:family]
  when 'debian'
    %w{ exuberant-ctags vim }.each do |p|
      describe package(p) do
        it { should be_installed }
      end
    end
  when 'redhat'
    %w{ ctags vim-common }.each do |p|
      describe package(p) do
        it { should be_installed }
      end
    end
  end

  %w{ mutt esmtp git git-email }.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end

  describe file('/etc/profile.d/01vimode.sh') do
    it { should be_file }
    it { should be_mode '644' }
    its(:content) { should match %r{set -o vi} }
  end
end
