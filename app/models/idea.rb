class Idea < ApplicationRecord
  has_one_attached :image
  validate :validate_image

  belongs_to :user, optional: true
  has_many :idea_tags
  has_many :tags, through: :idea_tags
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  scope :visible, ->{ where.not(private: true) }

  def validate_image
    if image.attached?
      if image.blob.byte_size > 1000000
        image.purge
        errors[:base] << 'Image too large'
      end
    end
  end

end
