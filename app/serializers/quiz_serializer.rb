class QuizSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::DateHelper

  attributes :id, :instructions, :duration, :quiz_type, :year, :name

  has_many(:questions)

  attribute :links do
    {
      self: quiz_path(object),
      questions: quiz_questions_path(object)
    }
  end

  def duration
    (object.duration - DateTime.new) / 1.hours
  end
end
