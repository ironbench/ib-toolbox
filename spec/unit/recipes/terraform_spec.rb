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

describe 'ib-toolbox::terraform' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'install unzip pacakge' do
    expect(chef_run).to install_package('unzip')
  end

  it 'create directory for terraform' do
    expect(chef_run).to create_directory('/opt/terraform')
  end

  it 'create directory for terraform version' do
    expect(chef_run).to create_directory('/opt/terraform/0.11.7')
  end

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("#{Chef::Config[:file_cache_path]}/terraform.zip").and_return(false)
  end

  it 'download terraform' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/terraform.zip")
  end

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with('/opt/terraform/0.11.7/terraform').and_return(false)
  end

  it 'extract terraform' do
    expect(chef_run).to run_execute('extract_terraform').with(command: "unzip #{Chef::Config[:file_cache_path]}/terraform.zip -d /opt/terraform/0.11.7")
  end

  it 'create a link to terraform executable' do
    expect(chef_run).to create_link('/usr/bin/terraform').with(to: '/opt/terraform/0.11.7/terraform')
  end
end
