ActiveAdmin.register Room do
      index do
        column :id do |room|
            link_to room.id, [:admin, room]
        end
        column "Room Number", :room_number
        column "Room Type", :room_type
      column "Bed Number", :bed_number
        column "Cleaned", :cleaned
    column "Comment", :comment
    end

    form do |f|
        f.inputs "" do
          f.input :room_number , :label => "Room Number:", :as => :select, :collection => ["1","2"]
          f.input :room_type , :label => "Room Type:", :as => :select, :collection => ["Regular", "Suite"]
          f.input :bed_number, :label => "Number of Beds:", :as => :select, :collection => ["1","2"]
          f.input :cleaned, :label => "Cleaning Status:", :as => :select, :collection => [true,false]
      f.input :comment, :label => "Comments:"
      f.buttons
        end
    end

    show :title => :name    do |room|
        attributes_table do
            row :id
            row("Room Number") {room.room_number}
            row("Room Type") {room.room_type}
            row("Bed Number") {room.bed_number}
            row("Cleaned") {room.cleaned}
      row("Comment") { hotel.comment }
        end
    end
end
