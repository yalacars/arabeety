class CreateTiers < ActiveRecord::Migration[5.1]
  def change
    create_table :tiers do |t|
      t.string :trim_types
      t.string :millages
      t.string :years
      t.string :number_owners
      t.string :ac
      t.string :breaks
      t.string :electrical
      t.string :rims
      t.string :seats
      t.string :radio
      t.string :steerng
      t.string :suspension
      t.string :transmission
      t.string :chasis
      t.string :engine_condition
      t.string :paint
      t.string :accident
      t.string :tier_name

      t.timestamps
    end
  end
end
