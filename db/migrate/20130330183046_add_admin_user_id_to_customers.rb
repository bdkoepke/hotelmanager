class AddAdminUserIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :admin_user_id, :integer
  end
end
