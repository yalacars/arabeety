class CreateYears < ActiveRecord::Migration[5.1]
  def change
    create_table :years do |t|
      t.string :date

      t.timestamps
    end
  end
end
