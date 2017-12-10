class UserMailer < ApplicationMailer  

  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Usuário Elabore"
  end
end
