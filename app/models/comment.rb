class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :idea
  has_closure_tree
end
