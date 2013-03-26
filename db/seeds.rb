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
Customer.create!(:email => 'customer@customer.com', :first_name => "Joe", :last_name => 'Schmoe', :address1 => "123 customer st NE", :province => "Alberta", :countryname => "Canada", :postalcode => "t3t-3t3", :phone => "403-222-2222")

