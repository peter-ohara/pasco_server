class AddCourseNameToQuiz < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :course_name, :string
  end
end
