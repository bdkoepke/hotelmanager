require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  test "hotel's attributes must not be empty except address2 and postalcode" do
    hotel = Hotel.new
    assert hotel.invalid?
    assert hotel.errors[:name].any?
    assert hotel.errors[:phone].any?
    assert hotel.errors[:email].any?
    assert hotel.errors[:address1].any?
	assert hotel.errors[:countryname].any?
    assert hotel.errors[:province].any?	
  end

  test "hotel's email is invalid" do
	hotel = Hotel.new(:name=>"DAY INN", :phone=>"334 454 5454" , :email=> "x", :address1=>"an address" , :countryname=>"Canada", :province=>"Alberta")    
    assert !hotel.save
  end

  test "hotel's email is valid" do
	hotel = Hotel.new(:name=>"DAY INN", :phone=>"334 454 5454" , :email=> "x@asc.com", :address1=>"an address" , :countryname=>"Canada", :province=>"Alberta")    
    assert hotel.save
  end

  test "hotel's phone is invalid" do
	hotel = Hotel.new(:name=>"DAY INN", :phone=>"3344543-5454" , :email=> "x@asc.com", :address1=>"an address" , :countryname=>"Canada", :province=>"Alberta")    
	assert !hotel.save   
  end

  test "hotel's phone is valid" do
	hotel = Hotel.new(:name=>"DAY INN", :phone=>"334 543 5454" , :email=> "asdx@asc.com", :address1=>"an address" , :countryname=>"Canada", :province=>"Alberta")    
	assert hotel.save   
  end


end
