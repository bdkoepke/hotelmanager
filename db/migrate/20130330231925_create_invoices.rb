class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :total
      t.references :reservation

      t.timestamps
    end
    add_index :invoices, :reservation_id
  end
end
