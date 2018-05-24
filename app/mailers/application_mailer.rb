# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "naoresponda@projetoelabore.com.br"
  layout "mailer"
end
