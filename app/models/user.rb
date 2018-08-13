class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_secure_password
  has_many :ideas
  has_many :votes
  has_many :voted_ideas, through: :votes, source: :idea
  has_many :comments
  before_create :generate_confirm_token
  before_create :generate_reset_token

  def generate_confirm_token
    self.confirmation_token = SecureRandom.uuid
  end

  def confirmation_link
    "#{ENV['APP_URL']}/confirm/#{self.confirmation_token}"
  end

  def send_confirmation_email
    UserConfirmationMailer.confirmation_email(self).deliver_later
  end

  def generate_reset_token
    self.reset_token = SecureRandom.uuid
  end

  def reset_link
    "#{ENV['APP_URL']}/reset/#{self.reset_token}"
  end

  def send_reset_email
    UserResetMailer.reset_email(self).deliver_later
  end

end
