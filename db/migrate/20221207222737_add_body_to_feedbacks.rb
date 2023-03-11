# frozen_string_literal: true

class AddBodyToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :body, :string
  end
end
