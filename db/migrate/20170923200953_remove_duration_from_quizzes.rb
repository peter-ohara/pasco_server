class RemoveDurationFromQuizzes < ActiveRecord::Migration[5.1]
  def change
    remove_column :quizzes, :duration, :datetime
  end
end
