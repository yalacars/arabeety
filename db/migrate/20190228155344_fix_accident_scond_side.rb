class FixAccidentScondSide < ActiveRecord::Migration[5.1]
  def change
  	rename_column :valuations, :accident_scond_side, :accident_second_side
  end
end
