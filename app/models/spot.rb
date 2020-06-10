class Spot < ApplicationRecord

  # Associations
  has_many :stories, dependent: :destroy
  belongs_to :category
  has_many :photos, as: :photoable

  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true
  validates :photo, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :location ],
    associated_against: {
      category: [ :name, :place_type]
    },
    using: {
      tsearch: { prefix: true }
    }


end
