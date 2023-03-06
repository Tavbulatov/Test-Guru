# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question
  before_validation :before_validation_time_over?
  before_validation :before_validation_test_passed?

  def completed?
    current_question.nil? || time_over?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def percentage_score
    self.correct_questions.to_f / test.questions.count * 100
  end

  def test_passed_successfully?
    percentage_score >= SUCCESS_RATIO
  end

  def remaining_questions_summ
    test.questions.order(:id).where('id > ?', current_question.id).count
  end

  private

  def time_over?
    (Time.now - self.created_at) / 60 >= test.time
  end

  def test_passed?
    self.passed = test_passed_successfully?
  end

  def next_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              test.questions.order(:id).where('id > ?', current_question.id).first
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_test_passed?
    test_passed?
  end

  def before_validation_time_over?
    time_over?
  end

  def before_validation_set_current_question
    next_question
  end
end
