ActiveAdmin.register Hotel do
  menu :if => proc{ current_admin_user.role == "admin" }
  
  index do
    column :id do |hotel|
      link_to hotel.id, [:admin, hotel]
    end
    column "Hotel Name", :name
    column :phone
    column :email
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
      f.input :name , :label => "Hotel Name:"
      f.input :phone , :label => "Phone:"
      f.input :email, :label => "Email:"
      f.input :address1, :label => "Address 1:"
      f.input :address2, :label => "Address 2:"
      f.input :province, :label => "Province / State:"
      f.input :countryname, :label => "Country:", :as => :select, :collection => ["Canada", "United States"]
      f.input :postalcode, :label => "Postal Code:"
      f.buttons
    end
  end

  show :title => :name do |hotel|
    attributes_table do
      row :id
      row :name
      row :phone
      row :email
      row :address1
      row :address2
      row :province
      row("Country") { hotel.countryname }
      row :postalcode
    end
  end
end
