class Course < ApplicationRecord

  has_many :purchases
  has_many :users, through: :purchases
  has_many :quizzes
end
