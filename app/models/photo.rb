class Photo < ApplicationRecord
  # Associations
  belongs_to :photoable, polymorphic: true
  has_one_attached :photo

  # Validations

end
