class AddLevelToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :level, :string
  end
end
