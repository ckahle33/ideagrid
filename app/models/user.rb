class User < ApplicationRecord
  has_secure_password
  has_many :projects
  has_many :votes
  has_many :voted_projects, through: :votes, source: :project
end
