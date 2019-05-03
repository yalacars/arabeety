class CreateMillages < ActiveRecord::Migration[5.1]
  def change
    create_table :millages do |t|
      t.string :range

      t.timestamps
    end
  end
end
