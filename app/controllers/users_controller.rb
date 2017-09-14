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
      redirect_to show_all_users_path
    else
      flash[:alert] = "Erro ao salvar usuário."
      render :new
    end

  end  

  def show
    @users = User.all.order(:tipo, :nome)
  end

  def delete    
    @user = User.find(params[:id])
    
    if @user.id == current_user.id
      flash[:alert] = "Você não pode excluir seu próprio usuário."    
    else
      if @user.destroy
        flash[:notice] = "Usuário deletado com sucesso."      
      else
        flash[:alert] = "Erro ao tentar remover usuário."      
      end
    end
    redirect_to show_all_users_path
  end

  private
    def user_params()
      params.require(:user).permit(:username, :nome, :responsavel, :telefone, :email, :tipo)
    end
end