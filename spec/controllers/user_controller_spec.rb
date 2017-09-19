require 'rails_helper'

RSpec.describe UsersController do
  describe "GET users" do
    it "get @users" do      
      get :show
      expect(response).to be_success
    end      
  end  
end

RSpec.describe UsersController do   
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
        expect(flash[:notice]).to match(/^Usuário salvo com sucesso./)    
      end
    end
  end
end


