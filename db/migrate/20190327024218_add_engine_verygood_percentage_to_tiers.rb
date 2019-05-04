class AddEngineVerygoodPercentageToTiers < ActiveRecord::Migration[5.1]
  def change
    add_column :tiers, :engine_verygood, :string
  end
end
