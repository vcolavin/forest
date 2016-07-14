class CreateRabbits < ActiveRecord::Migration
  def change
    create_table :rabbits do |t|
      t.timestamps
    end
  end
end
