class Spot < ApplicationRecord

  # Associations
  has_many :stories, dependent: :destroy
  belongs_to :category
  has_many :photos, as: :photoable

  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?




  def favourited(user)
    Favourite.where("spot_id = #{id} and user_id = #{user.id}")
  end
end
