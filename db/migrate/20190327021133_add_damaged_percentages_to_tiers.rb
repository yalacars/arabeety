class AddDamagedPercentagesToTiers < ActiveRecord::Migration[5.1]
  def change
    add_column :tiers, :roof_damaged, :float
    add_column :tiers, :roof_damaged_repaired, :float
    add_column :tiers, :roof_damaged_changed, :float
    add_column :tiers, :front_middle_bumper_damaged, :float
    add_column :tiers, :front_middle_bumper_repaired, :float
    add_column :tiers, :front_middle_bumper_changed, :float
    add_column :tiers, :left_front_bumper_damaged, :float
    add_column :tiers, :left_front_bumper_repaired, :float
    add_column :tiers, :left_front_bumper_changed, :float
    add_column :tiers, :right_front_bumper_damaged, :float
    add_column :tiers, :right_front_bumper_repaired, :float
    add_column :tiers, :right_front_bumper_changed, :float
    add_column :tiers, :right_front_door_damaged, :float
    add_column :tiers, :right_front_door_repaired, :float
    add_column :tiers, :right_front_door_changed, :float
    add_column :tiers, :right_back_door_damaged, :float
    add_column :tiers, :right_back_door_repaired, :float
    add_column :tiers, :right_back_door_changed, :float
    add_column :tiers, :left_front_door_damaged, :float
    add_column :tiers, :left_front_door_repaired, :float
    add_column :tiers, :left_front_door_changed, :float
    add_column :tiers, :left_back_door_damaged, :float
    add_column :tiers, :left_back_door_repaired, :float
    add_column :tiers, :left_back_door_changed, :float
    add_column :tiers, :middle_back_bumper_damaged, :float
    add_column :tiers, :middle_back_bumper_repaired, :float
    add_column :tiers, :middle_back_bumper_changed, :float
    add_column :tiers, :left_back_bumper_damaged, :float
    add_column :tiers, :left_back_bumper_repaired, :float
    add_column :tiers, :left_back_bumper_changed, :float
    add_column :tiers, :right_back_bumper_damaged, :float
    add_column :tiers, :right_back_bumper_repaired, :float
    add_column :tiers, :right_back_bumper_changed, :float
  end
end
