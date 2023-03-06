if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: 'licon', domain: 'licon.vercel.app', secure: true
else
  Rails.application.config.session_store :cookie_store, key: 'licon'
end