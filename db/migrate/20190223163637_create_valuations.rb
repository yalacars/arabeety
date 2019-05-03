class CreateValuations < ActiveRecord::Migration[5.1]
  def change
    create_table :valuations do |t|
      t.integer :user_id
      t.string :engine_condition
      t.string :notes_engine
      t.boolean :car_paint
      t.boolean :engine_problem
      t.boolean :accident
      t.string :ac
      t.string :radio
      t.string :type_Seller_buyer
      t.string :brand
      t.string :trim_select
      t.string :year_car
      t.string :model_car
      t.string :kilometers

      t.timestamps
    end
  end
end
