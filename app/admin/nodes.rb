ActiveAdmin.register Node do
  index do
    column :title
    column :location
    default_actions
  end

  show do |node|
    attributes_table do
      row :title
      row :location
      row :interfaces do
        ul do
          node.network_interfaces.each do |interface|
            li link_to(interface.name, admin_network_interface_path(interface)) + " (#{interface.address})"
          end
        end
      end
    end
    active_admin_comments
  end


end
