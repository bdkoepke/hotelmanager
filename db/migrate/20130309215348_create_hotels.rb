class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address1
      t.string :address2
      t.string :province
      t.string :countryname
      t.string :postalcode

      t.timestamps
    end
  end
end
