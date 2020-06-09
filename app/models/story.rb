class Story < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :spot
  has_many :photos, dependent: :destroy

  # Validations
  validates :user, presence: true
  validates :spot, presence: true
  validates :content, presence: true
  validates :photo, presence: true
end
