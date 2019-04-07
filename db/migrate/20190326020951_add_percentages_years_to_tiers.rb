class AddPercentagesYearsToTiers < ActiveRecord::Migration[5.1]
  def change
  	add_column :tiers, :total_year_percentage, :float
    add_column :tiers, :one_year, :float
    add_column :tiers, :two_year, :float
    add_column :tiers, :three_year, :float
    add_column :tiers, :four_year, :float
    add_column :tiers, :five_year, :float
    add_column :tiers, :six_year, :float
    add_column :tiers, :seven_year, :float
    add_column :tiers, :eight_year, :float
    add_column :tiers, :nine_year, :float
    add_column :tiers, :ten_year, :float
   
  end
end
