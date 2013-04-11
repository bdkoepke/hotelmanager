# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(:email => 'admin@admin.com', :password => "password" , :role => "admin")
AdminUser.create!(:email => 'sales1@admin.com', :password => "password" , :role => "sales associate")
Hotel.create!(:email => 'Hotel1@admin.com', :name => "Hotel1", :phone => "403-223-4567", :address1 => "123 test st SW", :province => "Alberta", :countryname => "Canada", :postalcode => "t2t-2t2" )
Hotel.create!(:email => 'HotelA@admin.com', :name => "HotelA", :phone => "403-322-7654", :address1 => "123 test st NW", :province => "Alberta", :countryname => "Canada", :postalcode => "t2l-4r2" )
Customer.create!(:email => 'Jschmoe@customer.com', :first_name => "Joe", :last_name => 'Schmoe', :address1 => "123 customer st NE", :province => "Alberta", :countryname => "Canada", :postalcode => "t4t-3t3", :phone => "403-222-2222")
Customer.create!(:email => 'JDoe@customer.com', :first_name => "Jane", :last_name => 'Doe', :address1 => "321 customer st NE", :province => "Alberta", :countryname => "Canada", :postalcode => "t3t-3r3", :phone => "403-333-3333")
Customer.create!(:email => 'JSmith@customer.com', :first_name => "John", :last_name => 'Smith', :address1 => "331 customer st NE", :province => "Alberta", :countryname => "Canada", :postalcode => "t4t-3r3", :phone => "403-333-3333")
Customer.create!(:email => 'BMill@customer.com', :first_name => "Bill", :last_name => 'Mill', :address1 => "111 customer st NE", :province => "Alberta", :countryname => "Canada", :postalcode => "t4t-4t3", :phone => "403-555-2222")
Room.create!(:hotel_id => 1, :name => '10', :room_type => "Regular", :bed_number => 2, :price => 24.99, :cleaned => true)
Room.create!(:hotel_id => 2, :name => '10', :room_type => "Regular", :bed_number => 4, :price => 34.99, :cleaned => true)
Room.create!(:hotel_id => 1, :name => '20', :room_type => "Suite", :bed_number => 4, :price => 44.99, :cleaned => true)
Room.create!(:hotel_id => 2, :name => '20', :room_type => "Suite", :bed_number => 2, :price => 34.99, :cleaned => false)
