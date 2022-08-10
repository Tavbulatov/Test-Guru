# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :before_validation_set_current_question, on: :create

  SUCCESS_RATIO = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    next_question
    save
  end

  def percentage_score
    self.correct_questions.to_f / test.questions.count * 100
  end

  def evaluation_comparison
    percentage_score >= SUCCESS_RATIO
  end

  private

  def next_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              test.questions.order(:id).where('id > ?', current_question.id).first
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end
end
