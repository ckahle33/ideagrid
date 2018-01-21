class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project
  has_closure_tree
end
