Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
      origins 'http://localhost:3000', 'https://localhost:3000'

      resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
  end

  #本番環境用のオリジン設定
  allow do
      origins 'https://licon.vercel.app'

      resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
  end
end

Rails.application.config.action_cable.allowed_request_origins = ['http://localhost:3000']