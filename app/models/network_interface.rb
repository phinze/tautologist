class NetworkInterface < ActiveRecord::Base
  attr_accessible :address, :host, :name, :bond

  belongs_to :host, :polymorphic => true

  belongs_to :bond, :class_name => 'NetworkInterface', :foreign_key => :bonded_interface_id

  def self.create_bond!(bond_name, bonded_interfaces)
    bond_interface = self.create!(
      :name => bond_name,
      :host => bonded_interfaces.first.host,
      :address => bonded_interfaces.first.address
    )

    bonded_interfaces.each do |bonded_interface|
      bonded_interface.update_attributes!(
        :bond => bond_interface
      )
    end

    bond_interface
  end
end

