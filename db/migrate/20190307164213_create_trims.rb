class CreateTrims < ActiveRecord::Migration[5.1]
  def change
    create_table :trims do |t|
      t.string :trim

      t.timestamps
    end
  end
end
