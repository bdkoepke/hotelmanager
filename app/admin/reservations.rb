ActiveAdmin.register Reservation do
  
  collection_action :getcols, :method => :get do
      # this is just a test ..
      number_adults =  params[:no_adults]
      number_children = 4 - Integer(number_adults) 
      respond_to do |format|
          format.json { render :json => number_children }
      end
      #layout => false
    end
   
   collection_action :getRooms, :method => :get do
      # get the rooms for a particular hotel ..
      hotel_id =  params[:hotel_id]
      #rooms = Hotel.find(hotel_id).rooms
      rooms = Room.where(:hotel_id => hotel_id).pluck(:name)
      respond_to do |format|
          format.json { render :json => rooms }
      end
    end

  controller.authorize_resource
    index do
      column :id do |registration|
    end
    column :hotel
    column :room
    column :customer
    column :date_in
    column :date_out
    default_actions		
  end

  form do |f|
    f.inputs "" do
      f.input :hotel
      f.input :room, :collection => {} 
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
