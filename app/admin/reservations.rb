ActiveAdmin.register Reservation do
  menu :if => proc{ current_admin_user.role == "admin" || current_admin_user.role == "sales associate"  || current_admin_user.role == "customer"}
  scope_to :current_admin_user, :association_method => :manage_reservations

  scope :all, :default => true
  scope :checked_in
  scope :checked_out

  #change status in index table 
  collection_action :changeStatus, :method => :get do
    status = params[:status] 
    reservationID = params[:reservation_id]
    myreservation = Reservation.find(reservationID)
    myreservation.update_attribute(:status, status)
     respond_to do |format|
          format.json { render :json => 1 }
      end
  end

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
      hotelid =  params[:hotel_id]
      roomtype = params[:room_type]

      if(roomtype == nil)
        rooms = Room.where(:hotel_id => hotelid).pluck(:name)
      else 
        rooms = Room.where(:hotel_id => hotelid, :room_type => roomtype).pluck(:name)
      end 
      @available_rooms = rooms
      respond_to do |format|
          format.json { render :json => rooms }
      end
    end

    collection_action :checkValidRoom, :method => :get do
      
      roomname = params[:room_name]
      hotelid =  params[:hotel_id]
      roomtype = params[:room_type]
      not_change = "false"

      if (Room.where(:hotel_id => hotelid, :room_type => roomtype, :name => roomname).count(:name) > 0)
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
    column :hotel
    column :room
    column :room_type
    column :customer
    column :date_in
    column :date_out
    column :status
    if (current_admin_user.role == "admin" || current_admin_user.role == "sales associate")
      column "Change Status" do |r|
        select_tag(:status, options_for_select( [['', r.id],['Checked-in', r.id] , ['Checked-out', r.id]]))     
      end
    end
    default_actions		
  end

  form do |f|
    f.inputs "" do
      f.input :hotel
      f.input :room_type, :as => :select, :collection => ["Regular", "Suite"]
      f.input :room, :label => "Available Rooms"# , :collection => {}
      #f.input :room,  :label => "Available Rooms" , :collection => @available_rooms
      if (current_admin_user.role == "admin" || current_admin_user.role == "sales associate")
        f.input :customer
      elsif (current_admin_user.role == "customer")
		f.input :customer_id, :as => :hidden, :value => current_admin_user.customer.id
	  end

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
