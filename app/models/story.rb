class Story < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :spot
  # Validations
end
