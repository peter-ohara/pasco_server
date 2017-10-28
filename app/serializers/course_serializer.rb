class CourseSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :level, :semester

  has_many(:quizzes)
end
