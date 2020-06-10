class Photo < ApplicationRecord
  # Associations
  belongs_to :photoable, polymorphic: true
  has_one_attached :file

  # Validations
  validate :file_attached?

  private

  def file_attached?
    errors.add(:base, 'Please upload a photo.') unless file.attached?
  end
end
