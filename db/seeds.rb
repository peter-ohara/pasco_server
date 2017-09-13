# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quiz = Quiz.create!(instructions: 'Here are some quiz instructions',
                    duration: nil,
                    quiz_type: 'mid_sem',
                    year: '2010',
                    course_code: 'CSM 157')

question = Question.create!(
  quiz: quiz,
  question_type: 'header',
  priority: '4',
  number: '3',
  question: 'What is photosynthesis?',
  choices: nil,
  answer: nil,
  explanation: 'Photosynthesis is the process by which plants make their food using sunlight, carbon dioxide and water'
)

question = Question.create!(
  quiz: quiz,
  question_type: 'mcq',
  priority: '4',
  number: '3',
  question: 'What is photosynthesis?',
  choices: nil,
  answer: nil,
  explanation: 'Photosynthesis is the process by which plants make their food using sunlight, carbon dioxide and water'
)

question = Question.create!(
  quiz: quiz,
  question_type: 'fill_in',
  priority: '4',
  number: '3',
  question: 'What is photosynthesis?',
  choices: nil,
  answer: nil,
  explanation: 'Photosynthesis is the process by which plants make their food using sunlight, carbon dioxide and water'
)

question = Question.create!(
  quiz: quiz,
  question_type: 'essay',
  priority: '4',
  number: '3',
  question: 'What is photosynthesis?',
  choices: nil,
  answer: nil,
  explanation: 'Photosynthesis is the process by which plants make their food using sunlight, carbon dioxide and water'
)

quiz = Quiz.create!(instructions: 'Here are some quiz instructions',
                    duration: nil,
                    quiz_type: 'end_of_sem',
                    year: '2010',
                    course_code: 'CSM 157')

quiz = Quiz.create!(instructions: 'Here are some quiz instructions',
                    duration: nil,
                    quiz_type: 'class_test',
                    year: '2010',
                    course_code: 'CSM 157')

quiz = Quiz.create!(instructions: 'Here are some quiz instructions',
                    duration: nil,
                    quiz_type: 'assignment',
                    year: '2010',
                    course_code: 'CSM 157')
