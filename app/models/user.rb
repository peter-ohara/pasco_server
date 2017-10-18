class User < ApplicationRecord
  has_secure_password

  def quizzes
    Quiz.all
  end
end
