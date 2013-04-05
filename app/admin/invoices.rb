ActiveAdmin.register Invoice do
  config.batch_actions = false
actions :index, :show, :destroy

scope :all, :default => true
scope :clear_balance
scope :outstanding_balance

index do
    column "Hotel" do |invoice|
      invoice.reservation.hotel.name
    end
    column "Customer" do |invoice|
      invoice.reservation.customer.name
    end
    
    column "Room" do |invoice|
      invoice.reservation.room.name
    end
    column "Total" do |invoice|
      invoice.reservation.room.price + invoice.reservation.rate_additional
    end
    
    default_actions
end

  show do
	@title = "Invoice - " + invoice.reservation.customer.name
  @status = invoice.reservation.status
  
  @balance = 0
  if(@status != "Checked-out")
    @balance = invoice.reservation.room.price + invoice.reservation.rate_additional
  end

  panel @title do


  attributes_table_for invoice do

   #for invoice.reservation.room_service do |service|
   #   row service.order do
   #     service.price
   #   end
   #end
		
    row "Room Price" do
          invoice.reservation.room.price
    end
		row "Additional Price" do
          invoice.reservation.rate_additional
    end
	  row  "Total" do
          invoice.reservation.room.price + invoice.reservation.rate_additional
    end
    row "Balance" do
        @balance
    end
    end
end
    active_admin_comments
  end
end
