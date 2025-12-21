Rails.application.routes.draw do
  # Devise Token Auth 用ルーティング
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "auth/registrations"
  }

  # letter_opener（開発環境のみ）
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Rooms 用ルーティング
  resources :rooms, only: [:create] do
    # /rooms/:id/join に POST
    post :join, on: :member
  end

  # QRコードやブラウザ直接アクセス用に GET /room/:id を Next.js へリダイレクト
  get '/room/:id', to: redirect("https://unstaggering-nonresidential-adelle.ngrok-free.dev/room/%{id}")

  # Stage ペンライト操作用 Webhook
  post '/stage/update', to: 'stage#update'

  # ActionCable 用 WebSocket
  mount ActionCable.server => '/cable'
end
