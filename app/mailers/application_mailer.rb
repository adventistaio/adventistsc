# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("hola@adventista.app", 'Adventista App')
  layout 'mailer'
end
