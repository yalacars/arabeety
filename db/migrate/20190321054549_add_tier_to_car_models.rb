class AddTierToCarModels < ActiveRecord::Migration[5.1]
  def change
    add_column :car_models, :tier, :integer
  end
end
