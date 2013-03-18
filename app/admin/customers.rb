ActiveAdmin.register Customer do
  controller.authorize_resource
  index do
    column :id do |customer|
      link_to customer.id, [:admin, customer]
    end
    column :first_name
    column :last_name
    column :email
    column :phone
    column :address1
    column :address2
    column :province
    column "Country", :countryname
    column "Postal Code", :postalcode
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
