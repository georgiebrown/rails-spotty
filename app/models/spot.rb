class Spot < ApplicationRecord
  # Associations
  has_many :stories, dependent: :destroy
  has_one_attached :photo
  belongs_to :category

  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?
end
