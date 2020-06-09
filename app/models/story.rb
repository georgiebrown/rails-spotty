class Story < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :spot
  has_many :photos, as: :photoable

  # Validations
  validates :user, presence: true
  validates :spot, presence: true
  validates :content, presence: true
  validates :photo, presence: true
end
