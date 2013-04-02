ActiveAdmin.register RoomService do

   collection_action :getRooms, :method => :get do
      # get the rooms for a particular hotel ..
      hotel_id =  params[:hotel_id]
      if (hotel_id != nil)
              rooms = Room.where(:hotel_id => hotel_id).pluck(:name)
      end


      respond_to do |format|
          format.json { render :json => rooms }
      end
    end



  controller.authorize_resource
    index do
      column :id do |room_service|
              link_to service.id, [:admin, room_service]
    end
    column :hotel_id
    column :room_name
    column :reservation_id
 #   column :customer_name
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
