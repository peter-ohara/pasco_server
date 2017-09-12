class QuizSerializer < ActiveModel::Serializer
  attributes :id, :instructions, :duration, :quiz_type, :year
end
