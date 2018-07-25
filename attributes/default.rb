# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

default['ib-toolbox']['packer']['version'] = '1.2.5'
default['ib-toolbox']['terraform']['version'] = '0.11.7'
default['ib-toolbox']['chefdk']['version'] = '3.1.0'

case node['platform_family']
when 'amazon', 'centos', 'fedora', 'debian', 'redhat', 'ubuntu'
  default['ib-toolbox']['packer']['source'] = "https://releases.hashicorp.com/packer/#{node['ib-toolbox']['packer']['version']}/packer_#{node['ib-toolbox']['packer']['version']}_linux_amd64.zip"
  default['ib-toolbox']['packer']['directory'] = '/opt/packer'

  default['ib-toolbox']['terraform']['source'] = "https://releases.hashicorp.com/terraform/#{node['ib-toolbox']['terraform']['version']}/terraform_#{node['ib-toolbox']['terraform']['version']}_linux_amd64.zip"
  default['ib-toolbox']['terraform']['directory'] = '/opt/terraform'

  case node['platform_family']
  when 'amazon', 'centos', 'fedora', 'redhat'
    default['ib-toolbox']['packer']['link'] = '/usr/local/bin/packer'

    default['ib-toolbox']['terraform']['link'] = '/usr/local/bin/terraform'

    default['ib-toolbox']['chefdk']['source'] = "https://packages.chef.io/files/stable/chefdk/#{node['ib-toolbox']['chefdk']['version']}/el/7/chefdk-#{node['ib-toolbox']['chefdk']['version']}-1.el7.x86_64.rpm"
  when 'debian'
    default['ib-toolbox']['packer']['link'] = '/usr/bin/packer'

    default['ib-toolbox']['terraform']['link'] = '/usr/bin/terraform'

    default['ib-toolbox']['chefdk']['source'] = "https://packages.chef.io/files/stable/chefdk/#{node['ib-toolbox']['chefdk']['version']}/debian/9/chefdk_#{node['ib-toolbox']['chefdk']['version']}-1_amd64.deb"
  when 'ubuntu'
    default['ib-toolbox']['packer']['link'] = '/usr/bin/packer'

    default['ib-toolbox']['terraform']['link'] = '/usr/bin/terraform'

    default['ib-toolbox']['chefdk']['source'] = "https://packages.chef.io/files/stable/chefdk/#{node['ib-toolbox']['chefdk']['version']}/ubuntu/18.04/chefdk_#{node['ib-toolbox']['chefdk']['version']}-1_amd64.deb"
  end
when 'mac_os_x'
  default['ib-toolbox']['packer']['source'] = "https://releases.hashicorp.com/packer/#{node['ib-toolbox']['packer']['version']}/packer_#{node['ib-toolbox']['packer']['version']}_darwin_amd64.zip"
  default['ib-toolbox']['packer']['directory'] = '/opt/packer'
  default['ib-toolbox']['packer']['link'] = '/usr/bin/packer'

  default['ib-toolbox']['terraform']['source'] = "https://releases.hashicorp.com/terraform/#{node['ib-toolbox']['terraform']['version']}/terraform_#{node['ib-toolbox']['terraform']['version']}_darwin_amd64.zip"
  default['ib-toolbox']['terraform']['directory'] = '/opt/terraform'
  default['ib-toolbox']['terraform']['link'] = '/usr/bin/terraform'

  default['ib-toolbox']['chefdk']['source'] = "https://packages.chef.io/files/stable/chefdk/#{node['ib-toolbox']['chefdk']['version']}/mac_os_x/10.13/chefdk-#{node['ib-toolbox']['chefdk']['version']}-1.dmg"
when 'windows'
  default['ib-toolbox']['packer']['source'] = "https://releases.hashicorp.com/packer/#{node['ib-toolbox']['packer']['version']}/packer_#{node['ib-toolbox']['packer']['version']}_windows_amd64.zip"
  default['ib-toolbox']['packer']['directory'] = '/opt/packer'
  default['ib-toolbox']['packer']['link'] = '/usr/bin/packer'

  default['ib-toolbox']['terraform']['source'] = "https://releases.hashicorp.com/terraform/#{node['ib-toolbox']['terraform']['version']}/terraform_#{node['ib-toolbox']['terraform']['version']}_windows_amd64.zip"
  default['ib-toolbox']['terraform']['directory'] = '/opt/terraform'
  default['ib-toolbox']['terraform']['link'] = '/usr/bin/terraform'

  default['ib-toolbox']['chefdk']['source'] = "https://packages.chef.io/files/stable/chefdk/#{node['ib-toolbox']['chefdk']['version']}/windows/2012r2/chefdk-#{node['ib-toolbox']['chefdk']['version']}-1-x64.msi"
end
