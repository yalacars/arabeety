class AddFlagsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :active_flag, :boolean
  end
end
