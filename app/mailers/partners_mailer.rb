# frozen_string_literal: true

class PartnersMailer < ApplicationMailer

  def new_partner(partner)
    @partner = partner
    mail to: 'projetoelabore@gmail.com', subject: "Novo Pedido de Parceria"
  end
end
