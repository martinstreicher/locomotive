#/
# Gems
#

#/ 
# List
#
gem 'aws-s3', 
  :lib      => 'aws/s3'

gem 'haml-edge',
  :lib      => 'haml'

gem 'mislav-will_paginate', 
  :version  => '~> 2.2.3', 
  :lib      => 'will_paginate',  
  :source   => 'http://gems.github.com'

gem 'ruby-openid',
  :lib => 'openid'

gem 'mongodb-mongo',
  :lib => 'mongo'

gem 'jnunemaker-mongomapper',
  :lib => 'mongomapper'

gem 'mysql'

gem 'rubyist-aasm', 
  :lib => 'aasm'

gem 'tlsmail'


#/ 
# Install
# 
rake("gems:install", :sudo => true)
