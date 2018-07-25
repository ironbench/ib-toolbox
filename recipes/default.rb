# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

case node['platform_family']
when 'debian', 'ubuntu'
  execute 'apt_update' do
    command 'apt-get update'
  end
when 'amazon', 'centos', 'fedora', 'redhat'
  execute 'yum_update' do
    command 'yum update'
  end
end

include_recipe 'ib-toolbox::packer'
include_recipe 'ib-toolbox::terraform'
