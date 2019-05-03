class AddFinalPriceFinalConditionToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :final_price, :float
    add_column :valuations, :final_condition, :string
  end
end
