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
when 'debian', 'ubuntu', 'amazon', 'centos', 'fedora', 'redhat'
  package 'unzip'

  directory node['ib-toolbox']['packer']['directory'] do
    owner 'root'
    group 'root'
    mode '755'
    recursive true
  end

  directory "#{node['ib-toolbox']['packer']['directory']}/#{node['ib-toolbox']['packer']['version']}" do
    owner 'root'
    group 'root'
    mode '755'
    recursive true
  end

  remote_file "#{Chef::Config[:file_cache_path]}/packer.zip" do
    source node['ib-toolbox']['packer']['source']
  end

  execute 'extract_packer' do
    command "unzip #{Chef::Config[:file_cache_path]}/packer.zip -d #{node['ib-toolbox']['packer']['directory']}/#{node['ib-toolbox']['packer']['version']}"
    not_if { ::File.exist?("#{node['ib-toolbox']['packer']['directory']}/#{node['ib-toolbox']['packer']['version']}/packer") }
  end

  link node['ib-toolbox']['packer']['link'] do
    to "#{node['ib-toolbox']['packer']['directory']}/#{node['ib-toolbox']['packer']['version']}/packer"
  end
end
