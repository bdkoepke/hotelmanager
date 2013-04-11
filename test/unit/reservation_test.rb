require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  fixtures :reservations, :hotels, :rooms, :customers
  #@hotel = Hotel.new(:name => "hotel", :phone => "333-333-3333" , :email => "myhotel@hotel.com" ,:address1 =>"???", :country => "CAN")
  #@room = Room.new(:name => "1", :room_type => "??", :bed_number => "1", :cleaned => "true", :hotel => @hotel.attributes)
  #@customer = Customer.new(:first_name => "User", :last_name => "User" , :email => "2@2.ca", :address1 => "Somewhere in canada", :country =>"CAN", :province => "AB", :phone => "333333333")
    
  test "should not save reservation with room conflicts" do
    reservation = Reservation.new(:room => rooms(:room2))
    reservation.valid?
    assert_not_nil reservation.errors.on(:room)
  end
  
  test "should not save reservation with invalid dates" do
  	@invalid_reservation = Reservation.new(:date_in => "10-10-2033", :date_out => "10-10-2000")
  	assert !@invalid_reservation.save
  	assert_not_nil @invalid_reservation.errors[:date_in]
  end

  test "should get error when additional rate is negative" do
  	@invalid_reservation = Reservation.new(:rate_additional => "-3")
  	assert !@invalid_reservation.save
  	assert_not_nil @invalid_reservation.errors[:rate_additional]
  end 

  test "should not allow a registration with no adults" do
	
  	@invalid_reservation = Reservation.new(:no_adults => "0", :no_children => "4", :customer => :valid_mike, :room => rooms(:room2))
  	assert !@invalid_reservation.save
  	assert_not_nil @invalid_reservation.errors[:no_adults]
  end

end
