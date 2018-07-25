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

describe 'ib-toolbox::packer' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'install unzip pacakge' do
    expect(chef_run).to install_package('unzip')
  end

  it 'create directory for packer' do
    expect(chef_run).to create_directory('/opt/packer')
  end

  it 'create directory for packer version' do
    expect(chef_run).to create_directory('/opt/packer/1.2.5')
  end

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("#{Chef::Config[:file_cache_path]}/packer.zip").and_return(false)
  end

  it 'download packer' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/packer.zip")
  end

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with('/opt/packer/1.2.5/packer').and_return(false)
  end

  it 'extract packer' do
    expect(chef_run).to run_execute('extract_packer').with(command: "unzip #{Chef::Config[:file_cache_path]}/packer.zip -d /opt/packer/1.2.5")
  end

  it 'create a link to packer executable' do
    expect(chef_run).to create_link('/usr/bin/packer').with(to: '/opt/packer/1.2.5/packer')
  end
end
