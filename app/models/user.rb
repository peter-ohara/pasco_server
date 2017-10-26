class User < ApplicationRecord
  has_secure_password

  has_many :purchases
  has_many :courses, through: :purchases

  def quizzes
    Quiz.visible_to_public.order(course_code: :asc)
  end
end
