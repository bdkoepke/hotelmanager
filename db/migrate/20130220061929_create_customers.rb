class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :province
      t.string :countryname
      t.string :postalcode
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
