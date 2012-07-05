class NetworkAddress < ActiveRecord::Base
  attr_accessible :address, :network, :network_interface

  belongs_to :network
  belongs_to :network_interface

  def host
    network_interface.host
  end

  scope :available, :conditions => { :network_interface_id => nil }
end
