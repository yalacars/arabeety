class AddMissingPercantagesSuspensionToTiers < ActiveRecord::Migration[5.1]
  def change
    add_column :tiers, :suspension_bad_percentage, :float
    add_column :tiers, :suspension_good_percentage, :float
    add_column :tiers, :suspension_verygood_percentage, :float
  end
end
