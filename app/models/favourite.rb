class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :spot

<<<<<<< HEAD

=======
  # Validations
  validates :spot, uniqueness: { scope: :user }
>>>>>>> master
end
