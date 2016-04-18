class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :x_coordinate
      t.integer :y_coordinate
    end
  end
end
