class Quiz < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name,
                  against: %i[course_code course_name quiz_type year],
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

  has_many :questions, dependent: :destroy

  def name
    "#{course_code} #{quiz_type.humanize.upcase} #{year}"
  end
end
