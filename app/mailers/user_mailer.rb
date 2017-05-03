class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @token = @user.confirmation_token
    mail(to: format_recipient(@user), subject: "Welcome to Gadup")
  end

end
