class RemovePlaceIdFromSpots < ActiveRecord::Migration[6.0]
  def change
    remove_column :spots, :place_id, :integer
  end
end
