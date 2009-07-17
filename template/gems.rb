#/
# Gems
#

gem 'aws-s3', 
  :lib      => 'aws/s3'

gem 'haml-edge',
  :lib      => 'haml'

gem 'mislav-will_paginate', 
  :version  => '~> 2.2.3', 
  :lib      => 'will_paginate',  
  :source   => 'http://gems.github.com'

gem 'mongodb-mongo'
gem 'mongodb-mongo_ext'
gem 'jnunemaker-mongomapper'
gem 'mysql'
gem 'rubyist-aasm'
gem 'ruby-openid'
gem 'tlsmail'


rake("gems:install", :sudo => true)
