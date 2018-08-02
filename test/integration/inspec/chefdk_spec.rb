# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

describe command('chef --version') do
  its('stdout') { should include 'Chef Development Kit Version:' }
  its(:exit_status) { should eq 0 }
end

describe command('chef gem list') do
  its('stdout') { should include 'test-kitchen' }
  its('stdout') { should include 'kitchen-ec2' }
  its('stdout') { should include 'inspec' }
  its('stdout') { should include 'kitchen-inspec' }
  its('stdout') { should include 'kitchen-docker' }
  its('stdout') { should include 'kitchen-sync' }
  its('stdout') { should include 'berkshelf' }
  its('stdout') { should include 'knife-block' }
  its('stdout') { should include 'docker-api' }
end
