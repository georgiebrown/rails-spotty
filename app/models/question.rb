class Question < ApplicationRecord
  belongs_to :category
  has_many :stories
  # enum qol_selection: ["your health", "your stress levels", "how safe you feel", "your education", "your home"]
end
