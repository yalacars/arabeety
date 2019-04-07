class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :year
      t.string :mileage
      t.string :condition
      t.string :damages

      t.timestamps
    end
  end
end
