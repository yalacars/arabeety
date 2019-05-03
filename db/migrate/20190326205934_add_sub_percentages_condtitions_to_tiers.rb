class AddSubPercentagesCondtitionsToTiers < ActiveRecord::Migration[5.1]
  def change

  	add_column :tiers, :ac_bad_percentage, :float
  	add_column :tiers, :ac_good_percentage, :float
  	add_column :tiers, :ac_verygood_percentage, :float


  	add_column :tiers, :brakes_bad_percentage, :float
  	add_column :tiers, :brakes_good_percentage, :float
  	add_column :tiers, :brakes_verygood_percentage, :float




  	add_column :tiers, :electrical_bad_percentage, :float
  	add_column :tiers, :electrical_good_percentage, :float
  	add_column :tiers, :electrical_verygood_percentage, :float




  	add_column :tiers, :rims_bad_percentage, :float
  	add_column :tiers, :rims_good_percentage, :float
  	add_column :tiers, :rims_verygood_percentage, :float



  	add_column :tiers, :seats_bad_percentage, :float
  	add_column :tiers, :seats_good_percentage, :float
  	add_column :tiers, :seats_verygood_percentage, :float



  	add_column :tiers, :radio_bad_percentage, :float
  	add_column :tiers, :radio_good_percentage, :float
  	add_column :tiers, :radio_verygood_percentage, :float



  	add_column :tiers, :steering_bad_percentage, :float
  	add_column :tiers, :steering_good_percentage, :float
  	add_column :tiers, :steering_verygood_percentage, :float



  	add_column :tiers, :transmission_bad_percentage, :float
  	add_column :tiers, :transmission_good_percentage, :float
  	add_column :tiers, :transmission_verygood_percentage, :float



  	add_column :tiers, :tyres_bad_percentage, :float
  	add_column :tiers, :tyres_good_percentage, :float
  	add_column :tiers, :tyres_verygood_percentage, :float



  	add_column :tiers, :chasis_bad_percentage, :float
  	add_column :tiers, :chasis_good_percentage, :float
  	add_column :tiers, :chasis_verygood_percentage, :float
  end
end
