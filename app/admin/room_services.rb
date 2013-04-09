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


  controller.authorize_resource
    index do
      column :id do |room_service|
              link_to room_service.id, [:admin, room_service]
    end
    column :hotel_id
   column :room_id
    column :reservation_id
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
    #  f.input :room_name
     # f.input :customer_name
      f.input :order
      f.input :price
      f.input :serviced 
      f.buttons
    end
  end
end
