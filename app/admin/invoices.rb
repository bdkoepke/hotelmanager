ActiveAdmin.register Invoice do
actions :index, :show, :destroy

index do
    column "Customer" do |invoice|
      invoice.reservation.customer.name
    end
    column :total
    column :created_at
    default_actions
end

  show do
	@title = "Invoice - " + invoice.reservation.customer.name
    panel @title do
  
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
