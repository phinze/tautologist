class Node < ActiveRecord::Base
  attr_accessible :hostname, :location

  belongs_to :location
  has_many :network_interfaces, :as => :host

  def title
    "#{hostname}.#{location.abbreviation}"
  end
end
