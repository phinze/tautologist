class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :abbreviation
      t.string :description

      t.timestamps
    end
  end
end
