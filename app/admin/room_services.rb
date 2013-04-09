ActiveAdmin.register RoomService do
  menu :if => proc{ current_admin_user.role == "admin" || current_admin_user.role == "sales associate" }



   collection_action :getRooms, :method => :get do
      # get the rooms for a particular hotel ..
      hotelid =  params[:hotel_id]
      rooms = Room.where(:hotel_id => hotelid).pluck(:name)
      @available_rooms = rooms
      respond_to do |format|
          format.json { render :json => rooms }
      end
    end

    collection_action :getReservation, :method => :get do
      # get the current reservation for the particular room
      roomid = params[:room_id]
      reservations = Reservation.where(:room_id => roomid).pluck(:id)
      @available_reservations = reservations
      respond_to do |format|
          format.json { render :json => reservations }
      end
    end

  controller.authorize_resource
    index do
      column :id do |room_service|
              link_to room_service.id, [:admin, room_service]
    end
    column :hotel
   column :room
    column :reservation
  # column :customer_name
   column :order
    column :price
    column :serviced
    default_actions   
  end

  form do |f|
    f.inputs "" do
      f.input :hotel
      f.input :room
      f.input :reservation
      f.input :order
      f.input :price
      f.input :serviced 
      f.buttons
    end
  end
end
