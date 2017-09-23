class AddDurationToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :duration, :float
  end
end
