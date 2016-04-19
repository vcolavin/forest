class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.integer :number_of_branches

      t.timestamps
    end
  end
end
