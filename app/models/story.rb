class Story < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :spot
  has_many :photos, as: :photoable

  accepts_nested_attributes_for :photos

  # Validations
  validates :user, presence: true
  validates :spot, presence: true
  validates :content, presence: true
end
