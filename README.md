hotelmanager
============

Hotel Management System

Rails 3.2.11
For ruby 1.9.2 requires :key => syntax in conflicting files when raking.

Getting Started
============
git clone git@github.com:bdkoepke/hotelmanager.git

cd hotelmanagement

bundle install --without production

rake db:create

rake db:migrate

bundle exec ruby script/secure_rails s

go to localhost:3000/

Username: admin@admin.com

Password: password
