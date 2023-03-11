class UserMailer < ApplicationMailer
  def password_reset
    @user = params[:user]
    @signed_id = @user.password_reset_tokens.create.signed_id(expires_in: 20.minutes)

    mail to: @user.email, subject: "Restaura tu contraseña"
  end

  def email_verification
    @user = params[:user]
    @signed_id = @user.email_verification_tokens.create.signed_id(expires_in: 2.days)

    mail to: @user.email, subject: "Valida tu cuenta de correo"
  end
end
