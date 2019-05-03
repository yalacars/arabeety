class CleanOldTiersColumns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :tiers, :trim_types
  	remove_column :tiers, :millages
  	remove_column :tiers, :years
  	remove_column :tiers, :number_owners
  	remove_column :tiers, :ac
  	remove_column :tiers, :breaks
  	remove_column :tiers, :electrical
  	remove_column :tiers, :rims
  	remove_column :tiers, :radio
  	remove_column :tiers, :seats
  	remove_column :tiers, :steerng
  	remove_column :tiers, :suspension
  	remove_column :tiers, :transmission
  	remove_column :tiers, :chasis
  	remove_column :tiers, :engine_condition
  	remove_column :tiers, :paint
  	remove_column :tiers, :accident

  end
end
