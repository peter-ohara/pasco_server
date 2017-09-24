# Class for extracting quizzes from json imported from Firebase,
# and saving them in this App's database
class QuizzesImporter
  require 'import_utils'
  require 'json'
  include ImportUtils

  def initialize(json_data)
    @courses_hash = json_data['courses']
    @tests_hash = json_data['tests']
    @questions_hash = json_data['questions']
  end

  def import_quizzes
    quiz = Quiz.create!(course_code: 'EE151',
                        course_name: 'Applied Electricity',
                        quiz_type: 'end_of_sem',
                        instructions: 'Each question is followed by four options lettered A to D.  Find out the correct option and circle without ambiguity the letter for the option you have chosen',
                        year: 2004,
                        duration: 3)

    question_keys = {
        "KNUEE15104EAH1": 3,
        "KNUEE15104EAH10": 46,
        "KNUEE15104EAH11": 49,
        "KNUEE15104EAH2": 7,
        "KNUEE15104EAH3": 11,
        "KNUEE15104EAH4": 15,
        "KNUEE15104EAH5": 26,
        "KNUEE15104EAH6": 30,
        "KNUEE15104EAH7": 35,
        "KNUEE15104EAH8": 38,
        "KNUEE15104EAH9": 43,
        "KNUEE15104EAQ1": 1,
        "KNUEE15104EAQ10": 13,
        "KNUEE15104EAQ11": 14,
        "KNUEE15104EAQ12": 16,
        "KNUEE15104EAQ13": 17,
        "KNUEE15104EAQ14": 18,
        "KNUEE15104EAQ15": 19,
        "KNUEE15104EAQ16": 20,
        "KNUEE15104EAQ17": 21,
        "KNUEE15104EAQ18": 22,
        "KNUEE15104EAQ19": 23,
        "KNUEE15104EAQ2": 2,
        "KNUEE15104EAQ20": 24,
        "KNUEE15104EAQ21": 25,
        "KNUEE15104EAQ22": 27,
        "KNUEE15104EAQ23": 28,
        "KNUEE15104EAQ24": 29,
        "KNUEE15104EAQ25": 31,
        "KNUEE15104EAQ26": 32,
        "KNUEE15104EAQ27": 33,
        "KNUEE15104EAQ28": 34,
        "KNUEE15104EAQ29": 36,
        "KNUEE15104EAQ3": 4,
        "KNUEE15104EAQ30": 37,
        "KNUEE15104EAQ31": 39,
        "KNUEE15104EAQ32": 40,
        "KNUEE15104EAQ33": 41,
        "KNUEE15104EAQ34": 42,
        "KNUEE15104EAQ35": 44,
        "KNUEE15104EAQ36": 45,
        "KNUEE15104EAQ37": 47,
        "KNUEE15104EAQ38": 48,
        "KNUEE15104EAQ39": 50,
        "KNUEE15104EAQ4": 5,
        "KNUEE15104EAQ40": 51,
        "KNUEE15104EAQ5": 6,
        "KNUEE15104EAQ6": 8,
        "KNUEE15104EAQ7": 9,
        "KNUEE15104EAQ8": 10,
        "KNUEE15104EAQ9": 12
    }

    question_keys.each do |key, priority|

      question_hash = @questions_hash[key.to_s]

      puts "Question #{key} #########"
      question_type = question_hash['type']
      title = question_hash['title']
      content = question_hash['content']
      number = question_hash['number']
      question = question_hash['question']
      choices = question_hash['choices'].values if question_hash['choices']
      answer = question_hash['answer']
      explanation = question_hash['explanation']

      puts priority
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
