# frozen_string_literal: true

class AddPassedToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :passed, :boolean
  end
end
