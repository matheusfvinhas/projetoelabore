require 'rails_helper'

RSpec.describe Edital, type: :model do
  context 'validations' do
    it "is valid" do
        @edital = Edital.create(titulo: 'Edital de teste', descricao: 'Edital criado para teste', usuario_id: 1)
        expect(@edital).to be_valid
    end

    it "without titulo" do
      @edital = Edital.create(descricao: 'Edital criado para teste', usuario_id: 1)
      expect(@edital).to be_invalid
    end 

    it "without descricao" do
      @edital = Edital.create(titulo: 'Edital de teste', usuario_id: 1)
      expect(@edital).to be_invalid
    end 

    it "without usuario" do
      @edital = Edital.create(titulo: 'Edital de teste', descricao: 'Edital criado para teste')
      expect(@edital).to be_invalid
    end 

    it "titulo has more then 100 characters" do
      @edital = Edital.create(titulo: (0..101).map { ('a'..'z').to_a[rand(26)] }.join, descricao: 'Edital criado para teste', usuario_id: 1)
      expect(@edital).to be_invalid
    end 

    it "descricao has more then 255 characters" do
      @edital = Edital.create(titulo: 'Edital de teste', descricao: (0..256).map { ('a'..'z').to_a[rand(26)] }.join, usuario_id: 1)
      expect(@edital).to be_invalid
    end 
  end
end
