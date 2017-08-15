class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password

    if @user.save
      flash[:notice] = "Usuário salvo com sucesso."      
      UserMailer.welcome(@user, generated_password).deliver_later
      redirect_to root_path
    else
      flash[:alert] = "Erro ao salvar usuário"
      render :new
    end

  end  

  private
    def user_params()
      params.require(:user).permit(:username, :nome, :responsavel, :telefone, :email, :tipo)
    end
end