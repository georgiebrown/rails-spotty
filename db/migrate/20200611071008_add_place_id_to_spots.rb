class AddPlaceIdToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :place_id, :string
  end
end
