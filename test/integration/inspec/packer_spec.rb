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
  describe command('which packer') do
    its('stdout') { should include '/usr/bin/packer' }
  end
end

describe command('packer version') do
  its('stdout') { should include 'Packer v' }
  its(:exit_status) { should eq 0 }
end
