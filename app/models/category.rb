class Category < ApplicationRecord
  has_many :spots
  has_many :questions
end
