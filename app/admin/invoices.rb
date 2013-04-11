ActiveAdmin.register Invoice do

controller do 
	def computeTotal
=begin		
		@services = RoomService.where(:hotel_id => invoice.reservation.hotel.id, :room_id => 			invoice.reservation.room.id)
		servicesTotal = 0
		for service in @services
			servicesTotal += service.price
		end	
		reservation.room.price + reservation.rate_additional + servicesTotal	
=end

	end
 end

  menu :if => proc{ current_admin_user.role == "admin" || current_admin_user.role == "sales associate" }

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
##
		@services = RoomService.where(:hotel_id => invoice.reservation.hotel.id, :room_id => 			invoice.reservation.room.id)
		servicesTotal = 0
		for service in @services
			servicesTotal += service.price
		end	
		if (invoice.reservation.rate_additional == nil)
			additional = 0
		else
			additional = invoice.reservation.rate_additional
		end
		invoice.reservation.room.price + additional + servicesTotal	

##
#  invoice.reservation.room.price + invoice.reservation.rate_additional
    end
    
    default_actions
end
  show do
	@title = "Invoice - " + invoice.reservation.customer.name
  @status = invoice.reservation.status
  
  

  panel @title do
	#@service = 
	@services = RoomService.where(:hotel_id => invoice.reservation.hotel.id, :room_id => invoice.reservation.room.id)
  attributes_table_for invoice do

	@service_prices = 0;
 	for service in @services
	@service_prices += service.price
row service.order do
			service.price
		end
end
	
    row "Room Price" do
          invoice.reservation.room.price
    end
	row "Additional Price" do

		if (invoice.reservation.rate_additional == nil)
			@additional = 0
		else
          	@additional =invoice.reservation.rate_additional
		end
    	end
	  row  "Total" do
	#:computeTotal          
		
@total = invoice.reservation.room.price + @additional + @service_prices
    end
    row "Balance" do
    if(@status != "Checked-out")
    	@total
    else
        0
end    
	end
    end
end
    active_admin_comments
  end
end
