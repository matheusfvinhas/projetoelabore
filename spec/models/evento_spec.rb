# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Evento, type: :model do
  context 'validations' do
    it "is valid" do
      @evento = Evento.create(titulo: 'Evento de teste', descricao: 'Evento criado para teste',
                              local: "Rua dos teste, 1337", data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_valid
    end

    it "without titulo" do
      @evento = Evento.create(descricao: 'Evento criado para teste',
                              local: "Rua dos teste, 1337", data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_invalid
    end

    it "without descricao" do
      @evento = Evento.create(titulo: 'Evento de teste',
                              local: "Rua dos teste, 1337", data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_invalid
    end

    it "without local" do
      @evento = Evento.create(titulo: 'Evento de teste', descricao: 'Evento criado para teste',
                              data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_invalid
    end

    it "without data" do
      @evento = Evento.create(titulo: 'Evento de teste', descricao: 'Evento criado para teste',
                              local: "Rua dos teste, 1337", usuario_id: 1)
      expect(@evento).to be_invalid
    end

    it "without usuario" do
      @evento = Evento.create(titulo: 'Evento de teste', descricao: 'Evento criado para teste',
                              local: "Rua dos teste, 1337", data: "21/12/2016")
      expect(@evento).to be_invalid
    end

    it "titulo has more then 100 characters" do
      @evento = Evento.create(titulo: (0..101).map { ('a'..'z').to_a[rand(26)] }.join, descricao: 'Evento criado para teste',
                              local: "Rua dos teste, 1337", data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_invalid
    end

    it "descricao has more then 255 characters" do
      @evento = Evento.create(titulo: 'Evento de teste', descricao: (0..256).map { ('a'..'z').to_a[rand(26)] }.join,
                              local: "Rua dos teste, 1337", data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_invalid
    end

    it "local has more then 100 characters" do
      @evento = Evento.create(titulo: 'Evento de teste', descricao: 'Evento criado para teste',
                              local: (0..101).map { ('a'..'z').to_a[rand(26)] }.join, data: "21/12/2016", usuario_id: 1)
      expect(@evento).to be_invalid
    end
  end
end
