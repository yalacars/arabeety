class AddAccidentPartsToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :accident_lights_left_front, :boolean
    add_column :valuations, :accident_lights_hood, :boolean
    add_column :valuations, :accident_lights_right_front, :boolean
    add_column :valuations, :accident_first_side, :boolean
    add_column :valuations, :accident_scond_side, :boolean
    add_column :valuations, :accident_third_side, :boolean
    add_column :valuations, :accident_fourth_side, :boolean
    add_column :valuations, :accident_first_top, :boolean
    add_column :valuations, :accident_second_top, :boolean
    add_column :valuations, :accident_third_top, :boolean
    add_column :valuations, :accident_left_back, :boolean
    add_column :valuations, :accident_middle_back, :boolean
    add_column :valuations, :accident_right_back, :boolean
  end
end
