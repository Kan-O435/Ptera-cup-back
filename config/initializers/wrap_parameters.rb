# config/initializers/wrap_parameters.rb
# このファイルを以下のように書き換える（または追記する）
ActiveSupport.on_load(:action_controller) do
  # 全てのコントローラーで自動ラッピングを無効にする
  wrap_parameters format: []
end
