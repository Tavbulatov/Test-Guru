# frozen_string_literal: true

class AddColumnCurrentQuestionAndCorrectQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_passages, :current_question
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
