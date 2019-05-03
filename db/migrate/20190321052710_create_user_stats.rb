class CreateUserStats < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stats do |t|
      t.string :state
      t.string :email

      t.timestamps
    end
  end
end
