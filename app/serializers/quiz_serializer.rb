class QuizSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper

  attributes :id,
             :course_code,
             :course_name,
             :quiz_type,
             :year,
             :duration,
             :instructions,
             :name,
             :question_count

  has_many(:questions)

  attribute :links do
    {
      self: quiz_path(object),
      questions: quiz_questions_path(object)
    }
  end
end
