class AddOpenToSpot < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :open, :boolean
  end
end
