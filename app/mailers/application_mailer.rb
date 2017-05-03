class ApplicationMailer < ActionMailer::Base
  #default email development
  default from: 'marief.rahman279@gmail.com'
  layout 'mailer'

  # #default email production
  # default from: "Gadup Empower Your Life <hello@gadup.co.id>", reply_to: "Gadup Support<support@gadup.co.id>"
  # layout 'mailer'

  protected
  def format_recipient(recipient)
    if recipient.is_a?(User)
      %("#{recipient.username}" <#{recipient.email}>)
    end
  end
  
end
