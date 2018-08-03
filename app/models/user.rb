class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  has_many :votes
  has_many :voted_ideas, through: :votes, source: :idea
  has_many :comments

end
