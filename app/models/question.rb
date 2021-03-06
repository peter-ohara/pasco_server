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

  rails_admin do
    edit do
      field :quiz
      field :priority
      field :question_type

      field :number

      field :question do
        partial 'question_question'
      end

      field :choices do
        partial 'question_choices'
      end

      field :answer do
        partial 'question_answer'
      end

      field :explanation do
        partial 'question_explanation'
      end

      field :title

      field :content do
        partial 'question_content'
      end
    end
  end

  def uploads
    "some upload"
  end
end
