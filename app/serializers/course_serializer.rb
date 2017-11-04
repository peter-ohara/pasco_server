class CourseSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :level, :semester, :price,
             :total_quiz_count,
             :mid_sem_count,
             :end_of_sem_count,
             :class_test_count,
             :assignment_count

  has_many(:quizzes)
end
