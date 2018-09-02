class Message < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id, optional: true
  has_closure_tree
end
