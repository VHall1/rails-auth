if Rails.env.test?
  # Default session store
else
  Rails.application.config.session_store :redis_session_store,
    key: '_rails_auth_session',
    domain: :all,
    redis: {
      expire_after: 2.weeks, # cookie expiration
      key_prefix: 'rails-auth:session:',
      url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'),
    }
end
