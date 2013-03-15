ActiveAdmin.register User do
  index :download_links => false do
    column :id
    column :email
    column :name
    column :created_at
    default_actions
  end
end
