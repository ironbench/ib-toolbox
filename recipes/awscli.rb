# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

package 'python-setuptools'
package 'unzip'

case node['platform_family']
when 'debian', 'ubuntu', 'amazon', 'centos', 'fedora', 'redhat'
  remote_file "#{Chef::Config[:file_cache_path]}/awscli-bundle.zip" do
    source 'https://s3.amazonaws.com/aws-cli/awscli-bundle.zip'
    notifies :run, 'execute[unzip_awscli_bundle]', :immediately
  end

  execute 'unzip_awscli_bundle' do
    command "unzip -o #{Chef::Config[:file_cache_path]}/awscli-bundle.zip -d #{Chef::Config[:file_cache_path]}"
    action :nothing
    notifies :run, 'execute[install_awscli_bundle]', :immediately
  end

  execute 'install_awscli_bundle' do
    command "python #{Chef::Config[:file_cache_path]}/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws"
    action :nothing
  end
end
