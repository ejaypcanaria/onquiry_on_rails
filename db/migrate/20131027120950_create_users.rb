class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.string :first_name,  limit: 60, null: false
      t.string :last_name,  limit: 50, null: false;
      t.string :email, limit: 100, null: false;
      t.string :password, limit: 40, null: false
      t.string :salt, limit: 40, null: false

      t.timestamps
    end
    
    add_index "users", [:email, :password,:salt]
    add_index "users", :email, unique: true, name: 'users_unique_email'

  end
end
