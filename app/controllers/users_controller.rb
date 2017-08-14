class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Usuário salvo com sucesso."
      redirect_to root_path
    else
      flash[:alert] = "Erro ao salvar usuário"
      render :new
    end

  end  

  private
    def user_params()
      params.require(:user).permit(:username, :nome, :responsavel, :telefone, :email, :password, :password_confirmation, :tipo)
    end
end