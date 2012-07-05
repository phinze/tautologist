class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.string :description
      t.string :cidr
      t.integer :location_id

      t.timestamps
    end

    create_table :network_addresses do |t|
      t.string :address
      t.integer :network_id
      t.integer :network_interface_id

      t.timestamps
    end

    create_table :network_interfaces do |t|
      t.string :address
      t.string :name
      t.integer :host_id
      t.string :host_type
      t.integer :bonded_interface_id

      t.timestamps
    end
  end
end
