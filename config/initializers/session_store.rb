# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_y_film_session',
  :secret      => 'a17e9ec3786699772ba3409a555c2c2ba1b7be4b358e94edd84670a5a2772731b91bdc8d035a623d659a4492144559250b3172016f36a0b3ba704a4369d733b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
