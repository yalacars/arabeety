class AddSubjectToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :subject, :string
  end
end
