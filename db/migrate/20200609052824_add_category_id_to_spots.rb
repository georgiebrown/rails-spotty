class AddCategoryIdToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :category, foreign_key: true
  end
end
