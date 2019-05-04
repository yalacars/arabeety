class AddOrderCToCarModels < ActiveRecord::Migration[5.1]
  def change
    add_column :car_models, :order_c, :integer
  end
end
