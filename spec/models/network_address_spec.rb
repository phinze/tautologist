require 'spec_helper'

describe NetworkAddress do
  context 'validations' do
    xit 'requires address to be unique within a network' do
      network = create(:network)
      existing_address = network.network_addresses.first

      address = NetworkAddress.new(:address => existing_address.address)
      address.should_not be_valid
    end
  end
end
