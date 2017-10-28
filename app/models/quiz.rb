class Quiz < ApplicationRecord
  include PgSearch

  belongs_to :course

  pg_search_scope :search_by_name,
                  against: %i[course_code course_name year],
                  using: {
                      tsearch: {
                          prefix: true,
                          any_word: true,
                          highlight: {
                              StartSel: '<start>',
                              StopSel: '<stop>',
                              MaxWords: 123,
                              MinWords: 456,
                              ShortWord: 4,
                              HighlightAll: true,
                              MaxFragments: 3,
                              FragmentDelimiter: '&hellip;'
                          }
                      }
                  }

  enum quiz_type: {
      mid_sem: 0,
      end_of_sem: 1,
      class_test: 2,
      assignment: 3
  }

  enum visibility: {
    visible_to_admins: 0,
    visible_to_public: 1
  }

  has_many :questions, -> {order 'priority ASC'},
           dependent: :destroy, inverse_of: :quiz


  validates :course_code, :course_name, :quiz_type, :year, presence: true

  validates :year, numericality: {
    only_integer: true,
    greater_than: 2000,
    less_than_or_equal_to: Date.current.year
  }

  validates :duration,
            numericality: { greater_than: 0, less_than_or_equal_to: 24 },
            allow_nil: true

  def name
    if quiz_type
      "#{course_code} #{quiz_type.humanize.titleize} #{year}"
    else
      "#{course_code} #{year}"
    end
  end

  def question_count
    questions.count
  end
end
