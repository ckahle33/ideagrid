class Suggestion < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: "email"
end
