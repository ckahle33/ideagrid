class Tag < ApplicationRecord
  has_many :projects, through: :project_tags
end
