class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :user_type
      t.string :permissions
      t.string :models

      t.timestamps
    end
  end
end
