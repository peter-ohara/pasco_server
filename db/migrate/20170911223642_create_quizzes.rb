class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.text :instructions
      t.datetime :duration
      t.integer :quiz_type
      t.integer :year

      t.timestamps
    end
  end
end
