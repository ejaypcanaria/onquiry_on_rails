class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.text :details
      t.string :permalink, null: false

      t.timestamps
    end
    
    add_index "questions", [:question,:permalink], unique: true, name: 'unique_question_permalink_index'
  end
end
