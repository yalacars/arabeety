class AddBrandToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :brand, :string
  end
end
