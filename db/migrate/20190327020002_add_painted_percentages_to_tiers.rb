class AddPaintedPercentagesToTiers < ActiveRecord::Migration[5.1]
  def change
    add_column :tiers, :roof_painted, :float
    add_column :tiers, :front_middle_bumper_painted, :float
    add_column :tiers, :left_front_bumper_painted, :float
    add_column :tiers, :right_front_bumper_painted, :float
    add_column :tiers, :right_front_door_painted, :float
    add_column :tiers, :right_back_door_painted, :float
    add_column :tiers, :left_front_door_painted, :float
    add_column :tiers, :left_back_door_painted, :float
    add_column :tiers, :middle_back_bumper_painted, :float
    add_column :tiers, :left_back_bumper_painted, :float
    add_column :tiers, :right_back_bumper_painted, :float
  end
end
