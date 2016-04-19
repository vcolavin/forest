class CreateLocationObjects < ActiveRecord::Migration
  def change
    create_table :location_objects do |t|
      t.integer :location_id
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
