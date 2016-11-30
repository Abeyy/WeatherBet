class AddLngToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :lng, :decimal, precision: 10, scale: 10
  end
end
