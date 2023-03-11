class SessionMailer < ApplicationMailer
  def signed_in_notification
    @session = params[:session]
    mail to: @session.user.email, subject: "Nuevo inicio de sesión en tu cuenta"
  end
end
