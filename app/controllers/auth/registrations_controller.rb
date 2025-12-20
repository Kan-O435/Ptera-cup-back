module Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    # JSON形式でのレスポンスを強制する
    respond_to :json

    private

    def sign_up_params
      # 届いている素のパラメーターを直接許可する
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
