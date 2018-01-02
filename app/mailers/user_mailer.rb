# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome(user, password)
    @user = user
    @password = password
    mail to: @user.email, subject: 'Usuário Elabore'
  end
end
