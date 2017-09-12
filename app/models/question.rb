class Question < ApplicationRecord
  enum quiz_type: {
    mid_sem: 0,
    end_of_sem: 1,
    class_test: 2,
    assignment: 3
  }

  belongs_to :quiz
end
