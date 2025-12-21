# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*" # 開発中は一旦すべて許可
    resource "*",
      headers: :any,
      # ここにトークン類を並べるのが非常に重要！
      expose: [ "access-token", "expiry", "token-type", "uid", "client" ],
      methods: [ :get, :post, :options, :delete, :put, :patch ]
  end
end
