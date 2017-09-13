class QuestionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :priority, :number, :question, :choices, :answer, :explanation

    attribute :links do
      {
        self: question_path(object),
        quiz: quiz_path(object.quiz)
      }
    end
end
