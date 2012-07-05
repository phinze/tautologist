class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :hostname
      t.integer :location_id

      t.timestamps
    end
  end
end
