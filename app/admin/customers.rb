ActiveAdmin.register Customer do
    menu :if => proc{ current_admin_user.role == "admin" || current_admin_user.role == "sales associate"  || current_admin_user.role == "customer"}
  scope_to :current_admin_user , :association_method => :manage_customer

  controller.authorize_resource
  index do
    column :id do |customer|
      link_to customer.id, [:admin, customer]
    end
    column :first_name
    column :last_name
    column :email
    column :phone
    column "Country", :countryname
	if (current_admin_user.role == "admin" || current_admin_user.role == "sales associate")
		column :admin_user
	end
    column :created_at 
    default_actions			
  end
	
  form do |f|
    f.inputs "" do
      f.input :first_name , :label => "First name:"
      f.input :last_name , :label => "Last name:"
      f.input :email, :label => "Email:"
      f.input :phone, :label => "Phone Number:"
      f.input :address1, :label => "Address 1:"
      f.input :address2, :label => "Address 2:"
      f.input :province, :label => "Province / State:"
      f.input :countryname, :label => "Country:", :as => :select, :collection => ["Canada", "United States"]
      f.input :postalcode, :label => "Postal Code:"
      f.buttons
    end
  end

  show :title => :first_name do |customer|		
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
	  if (current_admin_user.role == "admin" || current_admin_user.role == "sales associate")
		row :admin_user
	  end
      row :phone
      row :created_at
      row :address1
      row :address2
      row :province
      row("Country") { customer.countryname }
      row :postalcode
    end
  end	
end
