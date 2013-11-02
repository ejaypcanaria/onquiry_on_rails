class AddUserAssociationToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer, references: :users
    add_index :questions, :user_id, name: "user_id_index"
  end
  
end