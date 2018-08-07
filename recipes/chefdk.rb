# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

package 'git'

case node['platform_family']
when 'debian', 'ubuntu'
  remote_file "#{Chef::Config[:file_cache_path]}/chefdk.deb" do
    source node['ib-toolbox']['chefdk']['source']
  end

  dpkg_package 'chefdk' do
    source "#{Chef::Config[:file_cache_path]}/chefdk.deb"
    action :install
  end
when 'amazon', 'centos', 'fedora', 'redhat'
  remote_file "#{Chef::Config[:file_cache_path]}/chefdk.rpm" do
    source node['ib-toolbox']['chefdk']['source']
  end

  rpm_package 'chefdk' do
    source "#{Chef::Config[:file_cache_path]}/chefdk.rpm"
    action :install
  end
end

case node['platform_family']
when 'debian', 'ubuntu', 'amazon', 'centos', 'fedora', 'redhat'
  %w(
    test-kitchen
    kitchen-ec2
    inspec
    kitchen-inspec
    kitchen-docker
    kitchen-sync
    berkshelf
    knife-block
  ).each do |pkg|
    gem_package pkg do
      gem_binary '/opt/chefdk/embedded/bin/gem'
      options '--no-user-install --no-document --no-format-exec'
    end
  end

  gem_package 'docker-api' do
    version '1.34.0'
    options '--no-user-install --no-document --no-format-exec'
    gem_binary '/opt/chefdk/embedded/bin/gem'
  end

  execute 'install_awspec' do
    command "su - -c 'chef gem install awspec'"
    not_if "su - -c 'chef gem list | grep awspec'"
  end

  execute 'configure_awspec' do
    command 'ln -s /root/.chefdk/gem/ruby/2.5.0/bin/awspec /usr/bin/awspec'
    not_if { ::File.exist?('/usr/bin/awspec') }
  end

  cookbook_file '/opt/chefdk/embedded/lib/ruby/gems/2.5.0/gems/kitchen-docker-2.7.0/lib/kitchen/driver/docker.rb' do
    source 'docker.rb'
    owner 'root'
    group 'root'
    mode '0644'
  end
end
