class UserResetMailer < ApplicationMailer
  default :template_path => '/mailers'

  def reset_email(user)
    @user = user
    @url = user.reset_link
    mail( to: @user.email,
         subject: 'Confirm your account.' )
  end
end
