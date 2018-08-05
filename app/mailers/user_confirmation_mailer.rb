class UserConfirmationMailer < ApplicationMailer
  default :template_path => '/mailers'

  def confirmation_email(user)
    @user = user
    @url = user.confirmation_link
    mail( to: @user.email,
         subject: 'Confirm your account.' )
  end
end
