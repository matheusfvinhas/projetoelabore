# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parceiro, type: :model do
  context 'validations' do
    it "is valid" do
      @parceiro = Parceiro.create(nome: 'Novo parceiro', email: 'parceiro@parceiro.com.br',
                                  sobre: "Bom parceiro")
        expect(@parceiro).to be_valid
    end

    it "without email" do
      @parceiro = Parceiro.create(nome: 'Novo parceiro',
                                  sobre: "Bom parceiro")
        expect(@parceiro).to be_invalid
    end

    it "without nome" do
      @parceiro = Parceiro.create(email: 'parceiro@parceiro.com.br',
                                  sobre: "Bom parceiro")
        expect(@parceiro).to be_invalid
    end

    it "without sobre" do
      @parceiro = Parceiro.create(nome: 'Novo parceiro', email: 'parceiro@parceiro.com.br')
        expect(@parceiro).to be_invalid
    end

    it "nome has more then 50 characters" do
      @parceiro = Parceiro.create(nome: (0..51).map { ('a'..'z').to_a[rand(26)] }.join, email: 'parceiro@parceiro.com.br',
                                  sobre: "Bom parceiro")
        expect(@parceiro).to be_invalid
    end

    it "nome has more then 50 characters" do
      @parceiro = Parceiro.create(nome: 'Novo parceiro', email: (0..51).map { ('a'..'z').to_a[rand(26)] }.join,
                                  sobre: "Bom parceiro")
        expect(@parceiro).to be_invalid
    end

    it "sobre has more then 5000 characters" do
      @parceiro = Parceiro.create(nome: 'Novo parceiro', email: 'parceiro@parceiro.com.br',
                                  sobre: (0..5001).map { ('a'..'z').to_a[rand(26)] }.join)
        expect(@parceiro).to be_invalid
    end
  end
end
