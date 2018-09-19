class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User", optional: true
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User", optional: true
  has_closure_tree
end
