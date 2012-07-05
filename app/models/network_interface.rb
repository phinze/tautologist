class NetworkInterface < ActiveRecord::Base
  attr_accessible :address, :host, :name

  belongs_to :host, :polymorphic => true
end

