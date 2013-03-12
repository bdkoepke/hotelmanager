ActiveAdmin.register Reservation do
  controller.authorize_resource
	index do
		column :id do |registration|
		end
		column :hotel_name
		column :room_no
		column :first_name
		column :last_name
		column :date_in
		column :date_out
		default_actions		
	end  

	form do |f|
		f.inputs "" do
		f.input :hotel_name, :as => :select, :collection => Hotel.all  
		f.input :room_no
		f.input :first_name
		f.input :last_name 
		f.input :date_in, :as => :ui_date_picker
		f.input :date_out , :as => :ui_date_picker, :options => { minDate: Date.today}
		f.input :rate_daily 
		f.input :rate_additional 
		f.input :no_adults 
		f.input :no_children
		f.input :comment

		f.buttons
		end
	end
end
