class QuestionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id,
             :quiz_id,
             :question_type,
             :priority,
             :title,
             :content,
             :number,
             :question,
             :choices,
             :answer,
             :explanation

    attribute :links do
      {
        self: question_path(object),
        quiz: quiz_path(object.quiz)
      }
    end
end
