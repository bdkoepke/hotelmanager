require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  test "should not save reservation with room conflicts" do
    
  end
  
  test "should not save reservation with invalid dates" do
  	@invalid_reservation = Reservation.new(:date_in => "10-10-2033", :date_out => "10-10-2000")
  	assert !@invalid_reservation.save
  	assert_not_nil @invalid_reservation.errors[:date_in]
  end

  test "should get error when additional rate is negative" do
  	@invalid_reservation = Reservation.new(:additional_rate => "-3")
  	assert !@invalid_reservation.save
  	assert_not_nil @invalid_reservation.errors[:additional_rate]
  end 

  test "should not allow a registration with not adults" do
  	@invalid_reservation = Reservation.new(:no_adults => "0", :no_children => "4")
  	assert !@invalid_reservation.save
  	assert_not_nil @invalid_reservation.errors[:no_adults]
  end

end
