class AddValuationTypeNumberOwnersBrakesElectricalRimsSeatsSteeringSuspensionTransmissionTyresToValuations < ActiveRecord::Migration[5.1]
  def change
    add_column :valuations, :valuation_type, :string
    add_column :valuations, :number_owners, :string
    add_column :valuations, :brakes, :string
    add_column :valuations, :electrical, :string
    add_column :valuations, :rims, :string
    add_column :valuations, :seats, :string
    add_column :valuations, :steering, :string
    add_column :valuations, :suspension, :string
    add_column :valuations, :transmission, :string
    add_column :valuations, :tyres, :string
  end
end
