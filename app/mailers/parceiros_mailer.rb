class ParceirosMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.parceiros_mailer.pedir_parceria.subject
  #
  def pedir_parceria(nome, responsavel, email, sobre)
    @nome = nome
    @responsavel = responsavel
    @email = email
    @sobre = sobre
    mail to: 'matheusfvinhas@gmail.com', subject: "Novo Pedido de Parceria"
  end
end
