#/ 
# Add to environments
#

environment( 'config.active_record.observers = :user_observer' )
environment( 'config.load_paths += %W( #{RAILS_ROOT}/extras )' )
environment( 'config.log_level  = :debug' )
environment( 'config.plugins    = [ :all ]' )
environment( "config.time_zone  = 'config.Eastern Time (US & Canada)'" )
