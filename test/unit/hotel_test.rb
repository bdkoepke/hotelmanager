require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  test "hotel's attributes must not be empty except address2 and postalcode" do
    hotel = Hotel.new
    assert Hotel.invalid?
    assert Hotel.errors[:name].any?
    assert Hotel.errors[:phone].any?
    assert Hotel.errors[:email].any?
    assert Hotel.errors[:address1].any?
	assert Hotel.errors[:countryname].any?
    assert Hotel.errors[:province].any?
	
  end

  test "hotel's email is invalid" do
	hotel = Hotel.new(:name=>"DAY INN", :phone=>"334-4543-5454" , :email=> "x", :address1=>"an address" , :countryname=>"Canada", :province=>"Alberta")    
    assert !hotel.save
  end

  test "hotel's phone is invalid" do
	hotel = Hotel.new(:name=>"DAY INN", :phone=>"3344543-5454" , :email=> "x", :address1=>"an address" , :countryname=>"Canada", :province=>"Alberta")    
	assert !hotel.save   
  end

end
