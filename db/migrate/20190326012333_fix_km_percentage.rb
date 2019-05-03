class FixKmPercentage < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tiers, :one_kilomter, :one_kilometer
  	rename_column :tiers, :three_kilomter, :three_kilometer
  end
end
