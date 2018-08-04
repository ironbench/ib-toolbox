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

describe 'ib-toolbox::awscli' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'install python setuptools pacakge' do
    expect(chef_run).to install_package('python-setuptools')
  end

  it 'install unzip pacakge' do
    expect(chef_run).to install_package('unzip')
  end

  before do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with("#{Chef::Config[:file_cache_path]}/awscli-bundle.zip")
  end

  it 'download awscli bundle' do
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/awscli-bundle.zip")
  end

  it 'extract awscli bundle' do
    expect(chef_run.remote_file("#{Chef::Config[:file_cache_path]}/awscli-bundle.zip")).to notify('execute[unzip_awscli_bundle]').to(:run).immediately
  end

  it 'install awscli bundle' do
    expect(chef_run.execute('unzip_awscli_bundle')).to notify('execute[install_awscli_bundle]').to(:run).immediately
  end
end
