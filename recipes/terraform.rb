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

  directory node['ib-toolbox']['terraform']['directory'] do
    owner 'root'
    group 'root'
    mode '755'
    recursive true
  end

  directory "#{node['ib-toolbox']['terraform']['directory']}/#{node['ib-toolbox']['terraform']['version']}" do
    owner 'root'
    group 'root'
    mode '755'
    recursive true
  end

  remote_file "#{Chef::Config[:file_cache_path]}/terraform.zip" do
    source node['ib-toolbox']['terraform']['source']
  end

  execute 'extract_terraform' do
    command "unzip #{Chef::Config[:file_cache_path]}/terraform.zip -d #{node['ib-toolbox']['terraform']['directory']}/#{node['ib-toolbox']['terraform']['version']}"
    not_if { ::File.exist?("#{node['ib-toolbox']['terraform']['directory']}/#{node['ib-toolbox']['terraform']['version']}/terraform") }
  end

  link node['ib-toolbox']['terraform']['link'] do
    to "#{node['ib-toolbox']['terraform']['directory']}/#{node['ib-toolbox']['terraform']['version']}/terraform"
  end
end
