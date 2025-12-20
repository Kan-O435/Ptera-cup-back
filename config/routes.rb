Rails.application.routes.draw do
  # 現状、このように書かれているはずです
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "auth/registrations"
  }

  # もし letter_opener を使っているならその設定もあるはず
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
