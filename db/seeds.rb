# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
<<<<<<< HEAD
=======

AdminUser.create!(:email => 'admin@admin.com', :password => "password" , :role => "admin")
AdminUser.create!(:email => 'sales1@admin.com', :password => "password" , :role => "sales associate")

>>>>>>> 0456d704fc81140d9e461b4d934b862b91815b5e
