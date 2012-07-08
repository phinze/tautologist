namespace :db do
  task :do_over => ['db:drop', 'db:create', 'db:migrate'] do
    # populate data
    chicago = Location.create!(
      :abbreviation => 'chi',
      :name => 'Chicago',
      :description => 'Primary datacenter located in Chicago'
    )

    chicago_management_network = Network.create!(
      :location => chicago,
      :name => 'chicago_mgmt',
      :description => 'Chicago datacenter management network',
      :cidr => '172.23.12.0/24'
    )

    xen01 = Node.create!(:hostname => 'xen01', :location => chicago)

    xen01_eth0 = NetworkInterface.create!(:host => xen01, :name => 'eth0', :address => '12:34:45:78:90:a0')
    xen01_eth1 = NetworkInterface.create!(:host => xen01, :name => 'eth1', :address => '12:34:45:78:90:a1')
    xen01_eth2 = NetworkInterface.create!(:host => xen01, :name => 'eth2', :address => '12:34:45:78:90:a2')
    xen01_eth3 = NetworkInterface.create!(:host => xen01, :name => 'eth3', :address => '12:34:45:78:90:a3')

    xen01_bond0 = NetworkInterface.create_bond!('bond0', [xen01_eth0, xen01_eth2])

    chicago_management_network.assign_ip!(xen01_bond0)

    seattle = Location.create!(
      :abbreviation => 'sea',
      :name => 'Seattle',
      :description => 'Backup datacenter located in Seattle'
    )

    seattle_management_network = Network.create!(
      :location => seattle,
      :name => 'seattle_mgmt',
      :description => 'seattle datacenter management network',
      :cidr => '172.23.12.0/24'
    )

    xen01 = Node.create!(:hostname => 'xen01', :location => seattle)

    xen01_eth0 = NetworkInterface.create!(:host => xen01, :name => 'eth0', :address => '12:34:45:78:90:a0')
    xen01_eth1 = NetworkInterface.create!(:host => xen01, :name => 'eth1', :address => '12:34:45:78:90:a1')
    xen01_eth2 = NetworkInterface.create!(:host => xen01, :name => 'eth2', :address => '12:34:45:78:90:a2')
    xen01_eth3 = NetworkInterface.create!(:host => xen01, :name => 'eth3', :address => '12:34:45:78:90:a3')

    xen01_bond0 = NetworkInterface.create_bond!('bond0', [xen01_eth0, xen01_eth2])

    seattle_management_network.assign_ip!(xen01_bond0)
  end
end
