# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_wiki_session',
  :secret => '05e6094705c4d5b6bbc5bb4fc3559949c4fac9c9ca90a20f2942f032f2417f0de29fa2542abeb4118c578e4e51115b41923660971ee0e6a4ff0aec1c210c53d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
