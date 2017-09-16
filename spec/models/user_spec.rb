require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                     tipo: :admin, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")
    end

    it "The kind is admin" do        
        expect(@user.tipo).to eq("admin")
    end

    it "The kind is not professor" do        
        expect(@user.tipo).to_not eq("professor")
    end
end

RSpec.describe User, type: :model do
    before do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                     tipo: :professor, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")
    end

    it "The kind is professor" do        
        expect(@user.tipo).to eq("professor")
    end
end

RSpec.describe User, type: :model do
    before do
        @user = User.create(email: 'matheusfvinhas@gmail.com', password: 'rap007',
                     tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")
    end

    it "The kind is aluno" do        
        expect(@user.tipo).to eq("aluno")
    end
end

RSpec.describe User, type: :model do
    before do
        @valid_user = User.new(email: 'matheusfvinhas@gmail.com', password: 'rap007',
        tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")
        @non_valid_user = User.new(password: 'rap007',
        tipo: :aluno, nome: "Matheus", responsavel: "Matheus", telefone: "(12) 98169-7471")
    end

    it "should be valid" do
        expect(@valid_user).to be_valid
    end    

    it "should be invalid" do
        expect(@non_valid_user).to_not be_valid
    end   
end

