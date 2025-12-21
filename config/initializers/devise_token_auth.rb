# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  # 既存の設定
  config.token_cost = Rails.env.test? ? 4 : 10

  # --- ここから追加・修正した設定 ---

  # 1. メール認証を有効にする
  config.send_confirmation_email = true

  # 2. メールのリンクをクリックした後に戻るフロントエンドのURL
  config.default_confirm_success_url = "http://localhost:3000/dashboard"

  # 3. 開発しやすくするため、リクエストごとのトークン更新をオフにする
  config.change_headers_on_each_request = false

  # --- ここまで ---
end
