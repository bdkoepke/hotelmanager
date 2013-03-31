ActiveAdmin.register RoomService do

  controller.authorize_resource
    index do
      column :id do |room_service|
              link_to service.id, [:admin, room_service]
    end
    column :hotel_id
 #   column :room_name
 #   column :reservation_number
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
      f.input :customer
    #  f.input :room_name
     # f.input :customer_name
      f.input :order
      f.input :price
      f.input :serviced 
      f.buttons
    end
  end
end
