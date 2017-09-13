class QuizSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :instructions, :duration, :quiz_type, :year

  has_many(:questions)

  attribute :links do
    {
      self: quiz_path(object),
      questions: quiz_questions_path(object)
    }
  end
end
