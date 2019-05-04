class AddYearsEndToCarModels < ActiveRecord::Migration[5.1]
  def change
    add_column :car_models, :years_end, :integer
  end
end
