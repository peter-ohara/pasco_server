class AddVisibilityToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :visibility, :integer, default: 0
  end
end