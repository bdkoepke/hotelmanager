ActiveAdmin.register Customer do
	index do
		column :id do |customer|
			link_to customer.id, [:admin, customer]
		end
		column :first_name
		column :last_name
		column :email
		column :phone
		column :address
		column :created_at 
		default_actions			
	end  
	
	form do |f|
		f.inputs "" do
		f.input :first_name , :label => "First name:"
		f.input :last_name , :label => "Last name:"
		f.input :email, :label => "Email"
		f.input :phone, :label => "Phone Number:"
		f.input :address, :label => "Address:"
		f.buttons
		end
	end

	show :title => :first_name    do |customer|		
		attributes_table do
			row :id
			row :first_name
			row :last_name
			row :email
			row :phone
			row :created_at
			row :address
		end
	end	
end
