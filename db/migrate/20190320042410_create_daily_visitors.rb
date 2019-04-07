class CreateDailyVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_visitors do |t|
      t.string :user_email

      t.timestamps
    end
  end
end
