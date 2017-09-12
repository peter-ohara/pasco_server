class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :quiz, foreign_key: true
      t.integer :priority
      t.string :number
      t.text :question
      t.text :choices
      t.text :answer
      t.text :explanation

      t.timestamps
    end
  end
end
