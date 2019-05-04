class AddPriceBrandToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :car_models, :brand, :integer
    add_column :car_models, :price, :string
  end
end
