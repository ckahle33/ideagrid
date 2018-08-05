class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_secure_password
  has_many :ideas
  has_many :votes
  has_many :voted_ideas, through: :votes, source: :idea
  has_many :comments
  before_save :generate_confirm_link

  def generate_confirm_link
    self.confirmation_token = SecureRandom.urlsafe_base64(30)
  end

  def confirmation_link
    "#{ENV['APP_URL']}/confirm/#{self.confirmation_token}"
  end

  def send_confirmation_email
    UserConfirmationMailer.confirmation_email(self).deliver_later
  end

end
