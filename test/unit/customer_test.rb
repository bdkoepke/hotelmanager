require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  fixtures :customers 
  test "customer's attributes must not be empty except address" do
    customer = Customer.new
	assert customer.invalid?
    assert customer.errors[:first_name].any?
    assert customer.errors[:last_name].any?
    assert customer.errors[:email].any?
    assert customer.errors[:phone].any?
    assert Hotel.errors[:address1].any?
    assert Hotel.errors[:countryname].any?
    assert Hotel.errors[:province].any?

  end

  test "customer's email is invalid" do	
	customer = Customer.new(:first_name=>"mike", :last_name=>"tyson" , :email=> "asd", :phone=>"234-234-3344" )  
    assert !customer.save
  end

  test "customer's phone is invalid" do	
	customer = Customer.new(:first_name=>"mike", :last_name=>"tyson" , :email=> "mike@tyson.com", :phone=>"234 234 3344" )  
    assert !customer.save
  end
end
