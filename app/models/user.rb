class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  has_many :votes
  has_many :voted_projects, through: :votes, source: :project
  has_many :comments

end
