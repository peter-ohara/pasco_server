class Question < ApplicationRecord
  enum question_type: {
    header: 0,
    mcq: 1,
    fill_in: 2,
    essay: 3
  }
  belongs_to :quiz
end
