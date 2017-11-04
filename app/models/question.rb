class Question < ApplicationRecord
  enum question_type: {
    header: 0,
    mcq: 1,
    fill_in: 2,
    essay: 3
  }

  serialize :choices, Array

  belongs_to :quiz, inverse_of: :questions


  validates :priority, :question_type, presence: true

  validates :title, :content, presence: true, if: :header?

  validates :number, :question, :choices, presence: true, if: :mcq?

  validates :number, :question, presence: true, if: :fill_in?

  validates :number, :question, presence: true, if: :essay?

  def name
    if question_type == 'header'
      "#{title}. #{content}".truncate(80)
    else
      "#{number}. #{question}".truncate(80)
    end
  end

end
