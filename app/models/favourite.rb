class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :spot


  # Validations
  validates :spot, uniqueness: { scope: :user }

end
