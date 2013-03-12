class Addhoteltoregistration < ActiveRecord::Migration
  def change
	add_column :reservations, :hotel_name, :string
  end
end
