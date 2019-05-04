class AddEnginePercentagesToTiers < ActiveRecord::Migration[5.1]
  def change
    add_column :tiers, :engine_bad, :float
    add_column :tiers, :engine_good, :float
  end
end
