class AddPaintPartsToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :paint_lights_left_front, :boolean
    add_column :valuations, :paint_lights_hood, :boolean
    add_column :valuations, :paint_lights_right_front, :boolean
    add_column :valuations, :paint_first_side, :boolean
    add_column :valuations, :paint_second_side, :boolean
    add_column :valuations, :paint_third_side, :boolean
    add_column :valuations, :paint_fourth_side, :boolean
    add_column :valuations, :paint_first_top, :boolean
    add_column :valuations, :paint_second_top, :boolean
    add_column :valuations, :paint_third_top, :boolean
    add_column :valuations, :paint_left_back, :boolean
    add_column :valuations, :paint_middle_back, :boolean
    add_column :valuations, :paint_right_back, :boolean
  end
end
