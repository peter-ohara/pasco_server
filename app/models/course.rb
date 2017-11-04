class Course < ApplicationRecord

  has_many :purchases
  has_many :users, through: :purchases
  has_many :quizzes

  def title
    "#{code} #{name}"
  end

  def total_quiz_count
    quizzes.count
  end

  def mid_sem_count
    quizzes.mid_sem.count
  end

  def end_of_sem_count
    quizzes.end_of_sem.count
  end

  def class_test_count
    quizzes.class_test.count
  end

  def assignment_count
    quizzes.assignment.count
  end
end