ActiveAdmin.register Node do
  index do
    column :title
    column :location
    default_actions
  end
end
