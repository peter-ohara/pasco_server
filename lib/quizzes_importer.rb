# Class for extracting quizzes from json imported from Firebase,
# and saving them in this App's database
class QuizzesImporter
  require 'import_utils'
  include ImportUtils

  def initialize(json_data)
    @courses_hash = json_data['courses']
    @tests_hash = json_data['tests']
    @questions_hash = json_data['questions']
  end

  def import_quizzes
    @tests_hash.each do |_key, test_hash|

      course_key = test_hash['courseKey']
      course_code = @courses_hash[course_key]['code']
      course_name = @courses_hash[course_key]['name']

      quiz_type = get_quiz_type(test_hash['type'])
      year = test_hash['year']
      instructions = test_hash['instructions'].join('\n\n') if test_hash['instructions']
      duration = test_hash['duration']

      puts "Quiz #{_key} #########################################"
      puts course_code
      puts course_name
      puts quiz_type
      puts year
      puts instructions
      puts duration
      puts


      quiz = Quiz.create!(course_code: course_code,
                          course_name: course_name,
                          quiz_type: quiz_type,
                          year: year,
                          instructions: instructions,
                          duration: duration)

      puts "Quiz saved successfully with id #{quiz.id}"
      puts
      puts

      # Now the questions
      question_keys = test_hash['questionKeys']

      next unless question_keys

      question_keys.each do |key, priority|
        question_hash = @questions_hash[key]


        puts "Question #{key} #########"
        puts priority

        question_type = question_hash['type']
        title = question_hash['title']
        content = question_hash['content']
        number = question_hash['number']
        question = question_hash['question']
        choices = question_hash['choices'].values if question_hash['choices']
        answer = question_hash['answer']
        explanation = question_hash['explanation']

        puts question_type
        puts title
        puts content
        puts number
        puts question
        puts choices
        puts answer
        puts explanation
        puts

        new_question = Question.create!(quiz_id: quiz.id,
                                    priority: priority,
                                    question_type: question_type.underscore,
                                    title: title,
                                    content: content,
                                    number: number,
                                    question: question,
                                    choices: choices,
                                    explanation: explanation,
                                    answer: answer)

        puts "Question saved successfully with id #{new_question.id}"
        puts
      end
    end
  end
end