class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.string :password, limit: 40, null: false

      t.timestamps
    end
    
    add_index "users", [:email, :password]
  end
end
