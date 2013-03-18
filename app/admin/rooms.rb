ActiveAdmin.register Room do
  controller.authorize_resource
  index do
    column :id do |room|
      link_to room.id, [:admin, room]
    end
    column "Hotel", :hotel
    column "Room Number", :name
    column "Room Type", :room_type
    column "Bed Number", :bed_number
    column "Price", :price
    column "Cleaned", :cleaned
    column "Comment", :comment
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :name , :label => "Room Number:"
      f.input :room_type , :label => "Room Type:", :as => :select, :collection => ["Regular", "Suite"]
      f.input :bed_number, :label => "Number of Beds:", :as => :select, :collection => [1,2]
      f.input :hotel
      f.input :price
      f.input :cleaned, :label => "Cleaning Status:", :as => :select, :collection => [true,false]
      f.input :comment, :label => "Comments:"
      f.buttons
    end
  end

  show :title => :name do |room|
    attributes_table do
      row :id
      row :hotel
      row("Room Number") {room.name}
      row("Room Type") {room.room_type}
      row("Bed Number") {room.bed_number}
      row("Price") {room.price}
      row("Cleaned") {room.cleaned}
      row("Comment") { room.comment }
    end
  end
end
