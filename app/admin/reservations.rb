ActiveAdmin.register Reservation do
  menu :if => proc{ current_admin_user.role == "admin" || current_admin_user.role == "sales associate"  || current_admin_user.role == "customer"}
  scope_to :current_admin_user
  
  collection_action :getcols, :method => :get do
      
      number_beds   =  Room.where(:name => params[:room_name]).pluck(:room_type)
      number_spots  = number_beds * 2

      number_adults   =  params[:no_adults]
      number_children = number_spots - Integer(number_adults) 
      
      respond_to do |format|
          format.json { render :json => number_children }
      end
    end
   
   collection_action :getRooms, :method => :get do
      # get the rooms for a particular hotel ..
      hotel_id =  params[:hotel_id]
      room_type = params[:room_type]

      if(room_type == nil)
        rooms = Room.where(:hotel_id => hotel_id).pluck(:name)
      else 
        rooms = Room.where(:hotel_id => hotel_id, :room_type => room_type).pluck(:name)
      end 

      respond_to do |format|
          format.json { render :json => rooms }
      end
    end

    collection_action :checkValidRoom, :method => :get do
      
      room_name = params[:room_name]
      hotel_id =  params[:hotel_id]
      room_type = params[:room_type]
      not_change = "false"

      if (Room.where(:hotel_id => hotel_id, :room_type => room_type, :name => room_name).count(:name) > 0)
        not_change = "true"
      end

      respond_to do |format|
          format.json { render :json => not_change }
      end

    end

  controller.authorize_resource
    index do
      column :id do |registration|
              link_to registration.id, [:admin, registration]
      end
#	  if (!current_admin_user.role.nil?)
    column :hotel_id
#	  end
    column :room_id
    column :room_type
    column :customer
    column :date_in
    column :date_out
    default_actions		
  end

  form do |f|
    f.inputs "" do
      f.input :hotel
      f.input :room_type, :as => :select, :collection => ["Regular", "Suite"]
      f.input :room, :label => "Available Rooms" # , :collection => {}
      f.input :customer
      f.input :date_in, :as => :ui_date_picker
      f.input :date_out , :as => :ui_date_picker, :options => { minDate: Date.today}
      f.input :rate_additional 
      f.input :no_adults , :as => :select, :collection => [1,2,3,4]
      f.input :no_children, :as => :select, :collection => [0,1,2,3]
      f.input :comment
      f.buttons
    end
  end
end
