require 'rails_helper'

RSpec.describe UsersController do
    describe "GET users" do
      it "get @users" do      
        get :show
        expect(response).to be_success
      end  
      
    end
  

  describe 'POST #create' do
    context 'when email is not valid' do
      it 'save user and redirects to all users page' do       
  
        post :create, params: { user: { tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471" }}
  
        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/^Erro ao salvar usuário./)
      end
    end
  
    context 'when email is valid' do
      it 'save user and redirects to all users page' do            
  
        post :create, params: { user: { email: 'matheusfvinhas@gmail.com',
            tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471" }}
  
        expect(response).to redirect_to show_all_users_path       
      end
    end
  end

  describe 'DELETE #delete' do
    context 'when password is invalid' do
      it 'renders the page with error' do
        user = create(:user)
  
        post :create, session: { email: user.email, password: 'invalid' }
  
        expect(response).to render_template(:new)
        expect(flash[:notice]).to match(/^Email and password do not match/)
      end
    end
  
    context 'when password is valid' do
      it 'sets the user in the session and redirects them to their dashboard' do
        user = create(:user)
  
        post :create, session: { email: user.email, password: user.password }
  
        expect(response).to redirect_to '/dashboard'
        expect(controller.current_user).to eq user
      end
    end
  end
end