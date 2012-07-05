namespace :db do
  task :do_over => ['db:drop', 'db:create', 'db:migrate'] do
    # populate data
    chicago = Location.create!(
      :abbreviation => 'chi',
      :name => 'Chicago',
      :description => 'Datacenter located in Chicago'
    )

    chicago_management_network = Network.create!(
      :location => chicago,
      :name => 'chicago_mgmt',
      :description => 'Chicago datacenter management network',
      :cidr => '172.23.12.0/24'
    )

    xen01 = Node.create!(
      :hostname => 'xen01',
      :location => chicago
    )

    xen01_eth0 = NetworkInterface.create!(
      :host => xen01,
      :name => 'eth0',
      :address => '12:34:45:78:90:ab'
    )

    chicago_management_network.assign_ip!(xen01_eth0)
  end
end
