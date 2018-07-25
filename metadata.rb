# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

name 'ib-toolbox'
maintainer 'IronBench LLC'
maintainer_email 'infra@ironbench.io'
license 'All Rights Reserved'
description 'Installs/Configures tools used with IronBench products'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url 'https://github.com/ironbench/ib-toolbox/issues'
source_url 'https://github.com/ironbench/ib-toolbox'

%w( amazon centos fedora debian redhat ubuntu mac_os_x windows ).each do |os|
  supports os
end

chef_version '>= 13.2'

version '0.0.1'
