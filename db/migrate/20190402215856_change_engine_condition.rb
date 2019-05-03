class ChangeEngineCondition < ActiveRecord::Migration[5.1]
  def change
  	change_column :valuations, :engine_problem, :string
  end
end
