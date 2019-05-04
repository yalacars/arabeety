class AddSeenByAdminToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :seen_admin, :boolean
  end
end
