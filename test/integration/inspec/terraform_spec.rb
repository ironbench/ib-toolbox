# ----------------------------------------------------------------------------------
#
# IronBench Toolbox 2018.07.24
#
# Copyright (C) 2018 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

if os[:family] == 'debian' || os[:family] == 'ubuntu'
  describe command('which terraform') do
    its('stdout') { should include '/usr/bin/terraform' }
  end
end

describe command('terraform version') do
  its('stdout') { should include 'Terraform v' }
  its(:exit_status) { should eq 0 }
end
