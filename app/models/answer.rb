# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_number_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_number_answers
    errors.add(:answers, 'limit is 4') if question.answers.size >= 5
  end
end
