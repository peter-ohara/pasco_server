class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :priority, :number, :question, :choices, :answer, :explanation
  has_one :quiz
end
