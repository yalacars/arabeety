class ChangetypesAccident < ActiveRecord::Migration[5.1]
  def change
  	change_column :valuations, :accident_lights_left_front, :string
  	change_column :valuations, :accident_lights_hood, :string
  	change_column :valuations, :accident_lights_right_front, :string
  	change_column :valuations, :accident_first_side, :string
  	change_column :valuations, :accident_second_side, :string
  	change_column :valuations, :accident_third_side, :string
  	change_column :valuations, :accident_fourth_side, :string
  	change_column :valuations, :accident_first_top, :string
  	change_column :valuations, :accident_second_top, :string
  	change_column :valuations, :accident_third_top, :string
  	change_column :valuations, :accident_left_back, :string
  	change_column :valuations, :accident_middle_back, :string
  	change_column :valuations, :accident_right_back, :string

  end
end
