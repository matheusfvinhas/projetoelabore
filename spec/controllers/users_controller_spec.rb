# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET user" do
    it "get @user" do
      get user_path(1)
      expect(response).to be_successful
    end
  end

  describe "GET users" do
    it "get @users" do
      get users_path
      expect(response).to be_successful
    end
  end

  describe "GET new" do
    it "get new" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "when email is not valid" do
      it "save user and redirects to all users page" do
        post create_user_path, params: { user: { kind: :student, name: "Matheus", telephone: "(12) 98169-7471", institution_id: 1 } }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/^Erro ao salvar usuário./)
      end
    end

    context "when email is valid" do
      it "save user and redirects to all users page" do
        post create_user_path, params: { user: { email: "matheusfvinhas@gmail.com",
                                        kind: :student, name: "Matheus", telephone: "(12) 98169-7471", institution_id: 1 } }

        expect(response).to redirect_to users_path
        expect(flash[:notice]).to match(/^Usuário salvo com sucesso./)
      end
    end
  end
end
