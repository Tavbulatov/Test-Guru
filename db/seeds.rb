# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Математика' },
                               { title: 'Фармакология' }])

users = User.all

tests = Test.create!([{ title: 'Сложение', category: categories[0], author: users[0] },
                      { title: 'Вычитание', level: 1, category: categories[0], author: users[0] },
                      { title: 'НПВС', category: categories[1], author: users[0] },
                      { title: 'Противовирусные', level: 2, category: categories[1], author: users[0] }])

questions = Question.create!([{ body: '5 + 7 =', test: tests[0] },
                              { body: '10 + 8 =', test: tests[0] },
                              { body: '50-6-11 =', test: tests[1] },
                              { body: '78-15-13', test: tests[1] },
                              { body: 'Аспирин обладает такими качествами как:', test: tests[2] },
                              { body: 'Диклофенак мазь для чего ?', test: tests[2] },
                              { body: 'В каком виде бывает Ацикловир ?', test: tests[3] }])

answers = Answer.create!([{ body: '12', correct: true, question: questions[0] },
                          { body: '11', question: questions[0] },
                          { body: '9', question: questions[0] },
                          { body: '13', question: questions[0] },
                          { body: '18', correct: true, question: questions[1] },
                          { body: '17', question: questions[1] },
                          { body: '15', question: questions[1] },
                          { body: '19', question: questions[1] },
                          { body: '33', correct: true, question: questions[2] },
                          { body: '37', question: questions[2] },
                          { body: '35', question: questions[2] },
                          { body: '36', question: questions[2] },
                          { body: '50', correct: true, question: questions[3] },
                          { body: '51', question: questions[3] },
                          { body: '49', question: questions[3] },
                          { body: '52', question: questions[3] },
                          { body: 'Жаропонижающий,разжижает кровь,противоспалительное', correct: true,
                            question: questions[4] },
                          { body: 'Ветрогонный,снижает АД', question: questions[4] },
                          { body: 'Протигрибковое', question: questions[4] },
                          { body: 'Отхаркивающее', question: questions[4] },
                          { body: 'При травмах закрытого типа и воспалениях, устраняет болевой синдром', correct: true,
                            question: questions[5] },
                          { body: 'Для обработки ран как противомикробное, регенерирующее',
                            question: questions[5] },
                          { body: 'При обострениях псориаза', question: questions[5] },
                          { body: 'Противогрибковое', question: questions[5] },
                          { body: 'Мазь, таблетки', correct: true, question: questions[6] },
                          { body: 'Сироп', question: questions[6] },
                          { body: 'Гранулы', question: questions[6] },
                          { body: 'Р-р для В/В', question: questions[6] }])
