# Preview all emails at http://localhost:3000/rails/mailers/parceiros_mailer
class ParceirosMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/parceiros_mailer/pedir_parceria
  def pedir_parceria
    ParceirosMailer.pedir_parceria
  end

end
