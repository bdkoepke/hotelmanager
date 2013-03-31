ActiveAdmin.register Invoice do
actions :index, :show, :destroy

  show do
    panel "Invoice" do
  
attributes_table_for invoice do
        
		row "Room Price" do
          invoice.reservation.room.price
          end
		row "Additional Price" do
          invoice.reservation.rate_additional
          end
	[:total].each do |column|
          row column
        end
    end
end
    active_admin_comments
  end
end
