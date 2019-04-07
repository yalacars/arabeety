class AddYearsToCarModels < ActiveRecord::Migration[5.1]
  def change
    add_column :car_models, :years, :string
  end
end
