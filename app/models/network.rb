class Network < ActiveRecord::Base
  attr_accessible :cidr, :description, :location, :name

  belongs_to :location
  has_many :network_addresses

  after_create :create_host_ip_addresses

  def create_host_ip_addresses
    IPAddress.parse(cidr).hosts.each do |host_ip|
      NetworkAddress.create!(
        :address => host_ip.to_s,
        :network => self
      )
    end
  end

  def assign_ip!(network_interface)
    network_addresses.available.first.update_attributes!(
      :network_interface => network_interface
    )
  end
end
