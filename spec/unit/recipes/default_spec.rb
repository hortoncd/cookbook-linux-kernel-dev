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
  context 'When all attributes are default, on a ubuntu platform' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # debian family specific
    %w{ exuberant-ctags }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end

    # redhat family specific
    it 'sets up yum-epel' do
      expect(chef_run).to_not include_recipe('yum-epel')
    end

    # redhat family specific
    %w{ ctags }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to_not install_package(p)
      end
    end

    %w{ mutt esmtp git git-email vim }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end

    it 'sets up bash vimode' do
      expect(chef_run).to create_file('/etc/profile.d/01vimode.sh').with(
        content: 'set -o vi',
        user:    'root',
        group:   'root',
        mode:    '644',
      )
    end
  end
end

describe 'linux-kernel-dev::default' do
  context 'When all attributes are default, on a debian platform' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'debian', version: '7.1').converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # debian family specific
    %w{ exuberant-ctags vim }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end

    # rhel family specific
    it 'sets up yum-epel' do
      expect(chef_run).to_not include_recipe('yum-epel')
    end

    # redhat family specific
    %w{ ctags }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to_not install_package(p)
      end
    end

    %w{ mutt esmtp git git-email vim }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end

    it 'sets up bash vimode' do
      expect(chef_run).to create_file('/etc/profile.d/01vimode.sh').with(
        content: 'set -o vi',
        user:    'root',
        group:   'root',
        mode:    '644',
      )
    end
  end
end

describe 'linux-kernel-dev::default' do
  context 'When all attributes are default, on a centos platform' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.4').converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # debian family specific
    %w{ exuberant-ctags }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to_not install_package(p)
      end
    end

    # redhat family specific
    it 'sets up yum-epel' do
      expect(chef_run).to include_recipe('yum-epel')
    end

    # redhat family specific
    %w{ ctags }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end

    %w{ mutt esmtp git git-email vim }.each do |p|
      it "installs #{p}" do
        expect(chef_run).to install_package(p)
      end
    end

    it 'sets up bash vimode' do
      expect(chef_run).to create_file('/etc/profile.d/01vimode.sh').with(
        content: 'set -o vi',
        user:    'root',
        group:   'root',
        mode:    '644',
      )
    end
  end
end
