class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.text :answer, null: false

      t.timestamps
    end
    
    add_index :answers, [:question_id, :user_id], name: "answers_foreign_index"
  end
end