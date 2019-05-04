class AddConditionPercentagesToTiers < ActiveRecord::Migration[5.1]
  def change
  	add_column :tiers, :total_condition_percentage, :float
  	add_column :tiers, :ac_percentage, :float
  	add_column :tiers, :brakes_percentage, :float
  	add_column :tiers, :electrical_percentage, :float
  	add_column :tiers, :rims_percentage, :float
  	add_column :tiers, :seats_percentage, :float
  	add_column :tiers, :radio_percentage, :float
  	add_column :tiers, :steering_percentage, :float
  	add_column :tiers, :suspension_percentage, :float
  	add_column :tiers, :transmission_percentage, :float
  	add_column :tiers, :tyres_percentage, :float
  	add_column :tiers, :chasis_percentage, :float
  end
end
