# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

require 'spec_helper'

describe 'ib-toolbox::chefdk' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("#{Chef::Config[:file_cache_path]}/chefdk.deb").and_return(false)
  end

  it 'install git pacakge' do
    expect(chef_run).to install_package('git')
  end

  it 'download chefdk' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/chefdk.deb")
  end

  it 'install chefdk package' do
    expect(chef_run).to install_dpkg_package('chefdk')
  end

  it 'install chef gems' do
    %w(
      test-kitchen
      kitchen-ec2
      inspec
      kitchen-inspec
      kitchen-docker
      kitchen-sync
      berkshelf
      knife-block
    ).each do |pkg|
      expect(chef_run).to install_gem_package(pkg).with(gem_binary: '/opt/chefdk/embedded/bin/gem', options: '--no-user-install --no-document --no-format-exec')
    end
  end

  it 'install pinned version of docker-api' do
    expect(chef_run).to install_gem_package('docker-api').with(gem_binary: '/opt/chefdk/embedded/bin/gem', options: '--no-user-install --no-document --no-format-exec', version: '1.34.0')
  end

  it 'fix kitchen docker.rb' do
    expect(chef_run).to create_cookbook_file('/opt/chefdk/embedded/lib/ruby/gems/2.5.0/gems/kitchen-docker-2.7.0/lib/kitchen/driver/docker.rb').with(owner: 'root', group: 'root', mode: '0644')
  end
end
