require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  fixtures :hotels
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

  test "hotel is not valid without a unique email" do
    invalid_hotel = Hotel.new( :name => 'Cars Hotel', :email => hotels(:hotel).email, :phone => "234 233 4344", :address1 => "an address", :countryname=>"Canada", :province=>"Alberta")
    assert !invalid_hotel.save
    assert_equal "Email is already in our records.", invalid_hotel.errors[:email].join('; ')
  end

 test "hotel is not valid without a unique name" do
    invalid_hotel = Hotel.new( :name => hotels(:hotel).name, :email => "asd@adc.oms", :phone => "234 233 4344", :address1 => "an address", :countryname=>"Canada", :province=>"Alberta")
    assert !invalid_hotel.save
    assert_equal "Hotel name is aleady in our records.", invalid_hotel.errors[:name].join('; ')
  end


end
