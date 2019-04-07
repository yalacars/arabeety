class AddChasisToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :chasis, :string
  end
end
