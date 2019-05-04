class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :admin_id
      t.string :text
      t.integer :conversation_id

      t.timestamps
    end
  end
end
