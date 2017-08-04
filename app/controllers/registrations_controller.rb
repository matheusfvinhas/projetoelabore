class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :nome, :responsavel, :telefone, :minicv, :email)
  end

  def account_update_params
    params.require(:user).permit(:username, :nome, :responsavel, :telefone, :minicv, :email, :password, :current_password, :password_confirmation)
  end
end
