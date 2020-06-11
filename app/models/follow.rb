class Follow < ApplicationRecord
  # Associations
  belongs_to :leader, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  # Validations
  validates :leader, uniqueness: { scope: :follower }
end
