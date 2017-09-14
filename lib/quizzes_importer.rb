# Class for extracting quizzes from json imported from Firebase,
# and saving them in this App's database
class QuizzesImporter
  require 'import_utils'
  include ImportUtils

  def initialize(json_data)
    @courses_hash = json_data['courses']
    @tests_hash = json_data['tests']
  end

  def import_quizzes
    @tests_hash.each do |_key, test_hash|
      quiz = get_quiz_from_test_hash(test_hash)

      if quiz.save
        puts "Quiz created successfully: #{quiz.name}"
      else
        puts "Error creating quiz, #{quiz.errors.inspect}"
      end
    end
  end

  def get_quiz_from_test_hash(test_hash)
    course_key = test_hash['courseKey']
    course_code = @courses_hash[course_key]['code']
    quiz_type = get_quiz_type(test_hash['type'])
    year = test_hash['year']
    duration = DateTime.new  + test_hash['duration'].to_i.hours
    instructions = test_hash['instructions'].join('\n\n')


    quiz = Quiz.find_or_initialize_by(course_code: course_code,
                                      quiz_type: quiz_type,
                                      year: year,
                                      duration: duration)

    quiz.instructions = instructions
    quiz
  end
end