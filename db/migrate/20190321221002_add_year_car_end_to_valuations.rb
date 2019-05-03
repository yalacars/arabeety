class AddYearCarEndToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :year_car_end, :integer
  end
end
