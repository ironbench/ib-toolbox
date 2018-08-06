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

describe 'ib-toolbox::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  before(:each) do
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::awscli')
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::chefdk')
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::docker')
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::packer')
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::terraform')
  end

  it 'apt update' do
    expect(chef_run).to run_execute('apt-get update')
  end

  it 'include ib-toolbox::awscli' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::awscli')
    chef_run
  end

  it 'include ib-toolbox::chefdk' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::chefdk')
    chef_run
  end

  it 'include ib-toolbox::docker' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::docker')
    chef_run
  end

  it 'include ib-toolbox::packer' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::packer')
    chef_run
  end

  it 'include ib-toolbox::terraform' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('ib-toolbox::terraform')
    chef_run
  end
end
