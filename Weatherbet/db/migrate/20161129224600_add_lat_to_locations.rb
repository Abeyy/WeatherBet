class AddLatToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :lat, :decimal, precision: 10, scale: 10
  end
end
