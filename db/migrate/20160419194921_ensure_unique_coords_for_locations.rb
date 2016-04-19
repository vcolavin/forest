class EnsureUniqueCoordsForLocations < ActiveRecord::Migration
  def change
    add_index :locations, [:x_coordinate, :y_coordinate], :unique => true
  end
end
