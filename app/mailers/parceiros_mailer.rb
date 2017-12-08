class ParceirosMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.parceiros_mailer.pedir_parceria.subject
  #
  def new_partner(partner)
    @partner = partner
    mail to: 'matheusfvinhas@gmail.com', subject: "Novo Pedido de Parceria"
  end
end
