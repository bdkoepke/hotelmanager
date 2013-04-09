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
    assert customer.errors[:address1].any?
    assert customer.errors[:countryname].any?
    assert customer.errors[:province].any?

  end

  test "customer's email is invalid" do	
	customer = Customer.new(:first_name=>"mike", :last_name=>"tyson" , :email=> "asd", :phone=>"234-234-3344", :address1 => "an address", :countryname => "a country" , :province => "a province")  
    assert !customer.save
  end

  test "customer's email is valid" do	
	customer = Customer.new(:first_name=>"mike", :last_name=>"tyson" , :email=> "acustomer@admin.com", :phone=>"234 234 3344", :address1 => "an address", :countryname => "a country" , :province => "a province")  
    assert customer.save
  end

  test "customer's phone is invalid" do	
	customer = Customer.new(:first_name=>"mike", :last_name=>"tyson" , :email=> "asd", :phone=>"234233344", :address1 => "an address", :countryname => "a country" , :province => "a province")  
    assert !customer.save
  end

  test "customer's phone is valid" do	
	customer = Customer.new(:first_name=>"mike", :last_name=>"tyson" , :email=> "acustomer@gmail.com", :phone=>"234 233 4344", :address1 => "an address", :countryname => "a country" , :province => "a province")  
    assert customer.save
  end
end
