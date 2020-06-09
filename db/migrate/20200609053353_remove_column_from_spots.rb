class RemoveColumnFromSpots < ActiveRecord::Migration[6.0]
  def change
    remove_column :spots, :category, :string
    remove_column :spots, :category_id, :bigint
  end
end
