# Class for extracting multiple choice questions from json imported from Firebase,
# and saving them in this App's database
class MultipleChoiceQuestionsImporter
  require 'import_utils'
  include ImportUtils

  def initialize(json_data)
    @tests_hash = json_data['tests']
    @questions_hash = json_data['questions']
  end

  def import_questions
    @questions_hash.each do |_key, question_hash|
      test_key = question_hash['testKey']

      next unless @tests_hash[test_key]

      priority = @tests_hash[test_key]['questionKeys'][_key]
      quiz = get_quiz(test_key)

      create_multiple_choice_question(question_hash, quiz, priority)
    end
  end

  def create_multiple_choice_question(question_hash, quiz, priority)
    multiple_choice_question = get_multiple_choice_question(question_hash, quiz, priority)

    if multiple_choice_question.save
      puts "MultipleChoiceQuestion created successfully: #{multiple_choice_question.number}"
    else
      puts "Error creating multiple_choice_question, #{multiple_choice_question.errors.inspect}"
    end
  end

  def get_multiple_choice_question(question_hash, quiz, priority)
    question_type = question_hash['type']
    question = question_hash['question']
    answer = question_hash['answer']
    explanation = question_hash['explanation']
    number = question_hash['number']

    multiple_choice_question = Question.find_or_initialize_by(quiz_id: quiz.id,
                                                                            priority: priority,
                                                                            number: number,
                                                                            question: question,
                                                                            explanation: explanation,
                                                                            answer: answer)

    if (question_type == 'mcq')
      multiple_choice_question.choices = get_choices(question_hash['choices'])
    end
    multiple_choice_question
  end

  def get_choices(choices_hash)
    choices = []
    choices_hash.each do |_key, value|
      choices.push value
    end
    choices
  end
end