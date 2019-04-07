class AddPaintSecondLeftSideToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :paint_second_left_side, :boolean
    add_column :valuations, :paint_third_left_side, :boolean
    add_column :valuations, :accident_second_left_side, :string
    add_column :valuations, :accident_third_left_side, :string
  end
end
