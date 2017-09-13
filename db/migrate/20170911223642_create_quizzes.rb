class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :course_code
      t.integer :quiz_type
      t.integer :year
      t.text :instructions
      t.datetime :duration

      t.timestamps
    end
  end
end
