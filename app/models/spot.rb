class Spot < ApplicationRecord
  # Associations
  has_many :stories, dependent: :destroy
  belongs_to :user
  has_many :photos, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true
  validates :photo, presence: true
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?
end
