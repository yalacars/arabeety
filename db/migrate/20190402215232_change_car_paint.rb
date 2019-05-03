class ChangeCarPaint < ActiveRecord::Migration[5.1]
  def change
  	change_column :valuations, :car_paint, :string
  end
end
