# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do   
  it "The kind is admin" do 
    @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                        tipo: :admin, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")       
      expect(@user.tipo).to eq("admin")
  end

    it "The kind is professor" do   
      @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                          tipo: :professor, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")     
        expect(@user.tipo).to eq("professor")
    end

    it "The kind is aluno" do   
      @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                          tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")     
        expect(@user.tipo).to eq("aluno")
    end
end

RSpec.describe User, type: :model do
    
    context 'validations' do
        it "is valid" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, nome: "Matheus", responsavel: "Matheus")
            expect(@user).to be_valid
        end    

        it "without email" do
            @user = User.create(password: 'rap007',
            tipo: :aluno, nome: "Matheus", responsavel: "Matheus")
            expect(@user).to be_invalid
        end         

        it "without tipo" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            nome: "Matheus", responsavel: "Matheus")
            expect(@user).to be_invalid
        end 

        it "without nome" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, responsavel: "Matheus")
            expect(@user).to be_invalid
        end 

        it "without responsavel" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno)
            expect(@user).to be_invalid
        end 

        it "username has more then 20 characters" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, nome: "Matheus", responsavel: "Matheus", username: (0..20).map { ('a'..'z').to_a[rand(26)] }.join)
            expect(@user).to be_invalid
        end 

        it "name has more then 50 characters" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, nome: (0..51).map { ('a'..'z').to_a[rand(26)] }.join, responsavel: "Matheus")
            expect(@user).to be_invalid
        end 

        it "responsavel has more then 50 characters" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, nome: "Matheus", responsavel: (0..51).map { ('a'..'z').to_a[rand(26)] }.join)
            expect(@user).to be_invalid
        end 

        it "telefone has more then 15 characters" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: (0..16).map { ('a'..'z').to_a[rand(26)] }.join)
            expect(@user).to be_invalid
        end 

        it "minicv has more then 5000 characters" do
            @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
            tipo: :aluno, nome: "Matheus", responsavel: "Matheus", minicv: (0..5001).map { ('a'..'z').to_a[rand(26)] }.join)
            expect(@user).to be_invalid
        end 
        
    end
end
