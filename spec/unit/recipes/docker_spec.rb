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

describe 'ib-toolbox::docker' do
  let(:chef_run) { ChefSpec::SoloRunner.new(step_into: ['docker_installation_script']).converge(described_recipe) }

  it 'installs docker' do
    expect(chef_run).to create_docker_installation_script('default')
  end
end
