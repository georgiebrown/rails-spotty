class Photo < ApplicationRecord
  # Associations
  belongs_to :photoable, polymorphic: true
  has_one_attached :photo, dependent: :destroy

  # Validations
  validate :photo_attached?

  private

  def photo_attached?
    errors.add(:base, 'Please upload a photo.') unless photo.attached?
  end
end
