ActiveAdmin.register AdminUser do
  menu :if => proc{ current_admin_user.role == "admin" }
  controller.authorize_resource
  
  rolesnames = ["admin", "sales associate", "customer", "room service associate"]
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :role
    column :customer
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      #f.input :role
      f.input :role, :as => :select, :collection => rolesnames
    end
    f.actions
  end
end
