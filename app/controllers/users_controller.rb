class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      
    @user.password = Devise.friendly_token.first(8)    

    if @user.save
      flash[:notice] = 'Usuário salvo com sucesso.'  
      UserMailer.welcome(@user, @user.password).deliver_later
      redirect_to show_all_users_path
    else
      flash[:alert] = 'Erro ao salvar usuário.'
      render :new
    end
  end  

  def index
    @users = User.all.order(:kind, :name).page(params[:page]).per(10)
  end

  def destroy    
    @user = User.find(params[:id])
    
    if @user.id == current_user.id
      flash[:alert] = 'Você não pode excluir seu próprio usuário.'
    else
      if @user.destroy
        flash[:notice] = 'Usuário deletado com sucesso.'
      else
        flash[:alert] = 'Erro ao tentar remover usuário.'
      end
    end
    redirect_to show_all_users_path
  end

  private

    def user_params()
      params.require(:user).permit(:username, :name, :responsible, :telephone, :email, :kind)
    end
end