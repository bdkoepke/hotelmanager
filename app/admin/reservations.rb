ActiveAdmin.register Reservation do
  controller.authorize_resource
	index do
		column :id do |registration|
		end
		column :room
		column :customer
		column :date_in
		column :date_out
		default_actions		
	end  

	form do |f|
		f.inputs "" do
			f.input :room
			f.input :customer
			f.input :date_in, :as => :ui_date_picker
			f.input :date_out , :as => :ui_date_picker, :options => { minDate: Date.today}
			f.input :rate_additional 
			f.input :no_adults , :as => :select, :collection => [0,1,2,3,4]
			f.input :no_children, :as => :select, :collection => [0,1,2,3,4]
			f.input :comment
			f.buttons
		end
	end
end
