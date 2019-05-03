class AddPercentagesToTiers < ActiveRecord::Migration[5.1]
  def change
    add_column :tiers, :total_kilometer_percentage, :float
    add_column :tiers, :one_kilomter, :float
    add_column :tiers, :two_kilometer, :float
    add_column :tiers, :three_kilomter, :float
    add_column :tiers, :four_kilometer, :float
    add_column :tiers, :five_kilometer, :float
    add_column :tiers, :six_kilometer, :float
    add_column :tiers, :seven_kilometer, :float
    add_column :tiers, :eight_kilometer, :float
    add_column :tiers, :nine_kilometer, :float
    add_column :tiers, :ten_kilometer, :float
    add_column :tiers, :eleven_kilometer, :float
    add_column :tiers, :twelve_kilometer, :float
    add_column :tiers, :thirteen_kilometer, :float
    add_column :tiers, :fourteen_kilometer, :float
    add_column :tiers, :fifthteen_kilometer, :float
    add_column :tiers, :sixthteen_kilometer, :float
  end
end
