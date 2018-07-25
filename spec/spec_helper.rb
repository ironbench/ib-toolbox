# ----------------------------------------------------------------------------------
#
# Cloud Config 2017.11.01
#
# Copyright (C) 2017 Iron Bench, LLC - All Rights Reserved
# Licensed under and all use is subject to the Iron Bench Master Software
# License Agreement and all related Master Service Agreements and Statements of Work
#
# ----------------------------------------------------------------------------------

require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start!

RSpec.configure do |c|
  c.platform = 'ubuntu'
  c.version = '16.04'
  c.log_level = :fatal
  c.color = true
  c.formatter = 'documentation'
  c.file_cache_path = '/var/chef/cache'
end
