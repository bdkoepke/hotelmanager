ActiveAdmin.register RoomService do
  menu :if => proc{ current_admin_user.role == "admin" || current_admin_user.role == "sales associate" || current_admin_user.role == "room service associate"}



   collection_action :getRooms, :method => :get do
      # get the rooms for a particular hotel ..
      hotelid =  params[:hotel_id]
      dtoday = Date.today
#      reservations = Reservation.where(:hotel_id => hotelid)
  #    reservations = Reservation.where("hotel_id == ? AND date_in >= ? AND date_out <= ?", params[:hotel_id], dtoday, dtoday).pluck(:room_id)
 #     if (reservations.size > 0)
        rooms = Room.where(:hotel_id => hotelid).pluck(:name)
 #       i = 0
 #       siz = rooms.size
 #       while (i < siz)
 #         j = 0  
 #         ressiz = reservations.size
 #         removeRoom = true
 #         
 #         while (j < ressiz && removeRoom)   
 #           if (rooms[i].id == reservation[j].room_id)
 #             removeRoom = false
 #           end
 #           j += 1
 #         end
 #         if (removeRoom)
 #           rooms.delete_at(i)
 #         end
          
 #         i += 1   
 #       end  
 #     elsif (reservations == 0)
 #       rooms = nil
 #     end
      
      @available_rooms = rooms
      respond_to do |format|
          format.json { render :json => rooms }
      end
    end

    collection_action :getReservation, :method => :get do
      # get the current reservation for the particular room
      roomid = params[:room_id]
      dtoday = Date.today
      reservations = Reservation.where("room_id == ? AND date_in <= ? AND date_out >= ?", params[:room_id], dtoday, dtoday).pluck(:room_id)
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
   #   f.input :service_date, :value =>  Date.today
      f.buttons
    end
  end
end
