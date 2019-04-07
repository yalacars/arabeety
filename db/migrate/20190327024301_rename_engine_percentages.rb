class RenameEnginePercentages < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tiers, :engine_bad, :engine_damaged
  	rename_column :tiers, :engine_good, :engine_repaired
  	rename_column :tiers, :engine_verygood, :engine_changed
  end
end
