class RemovePricesFromBrands < ActiveRecord::Migration[5.1]
  def change
    remove_column :brands, :price
  end
end
